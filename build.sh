#!/usr/bin/env bash
# ==============================================================================
# Garis Diagram Editor - Offline Standalone Build Script
#
# Downloads external CDN scripts (Tailwind CSS, Lucide Icons, Mermaid.js)
# and inlines them directly into dist/index.html using standard POSIX awk.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_HTML="${SCRIPT_DIR}/index.html"
DIST_DIR="${SCRIPT_DIR}/dist"
CACHE_DIR="${SCRIPT_DIR}/.cache"
OUT_HTML="${DIST_DIR}/index.html"

TAILWIND_URL="https://cdn.tailwindcss.com"
LUCIDE_URL="https://unpkg.com/lucide@latest"
MERMAID_URL="https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.min.js"

TAILWIND_JS="${CACHE_DIR}/tailwind.js"
LUCIDE_JS="${CACHE_DIR}/lucide.js"
MERMAID_JS="${CACHE_DIR}/mermaid.min.js"

FORCE_DOWNLOAD=false
if [ "${1:-}" = "--force" ] || [ "${1:-}" = "-f" ] || [ "${1:-}" = "--clean" ]; then
  FORCE_DOWNLOAD=true
fi

mkdir -p "${DIST_DIR}"
mkdir -p "${CACHE_DIR}"

echo "====================================================="
echo " Building Offline Standalone Garis Diagram Editor"
echo "====================================================="

download_asset() {
  local name="$1"
  local url="$2"
  local dest="$3"

  if [ -s "${dest}" ] && [ "${FORCE_DOWNLOAD}" != "true" ]; then
    echo "  [cached]     ${name} (${dest})"
  else
    echo "  [download]   ${name} from ${url}..."
    curl -s -L -f --retry 3 --retry-delay 2 "${url}" -o "${dest}"
    echo "  [downloaded] ${name} ($(du -h "${dest}" | cut -f1))"
  fi
}

download_asset "Tailwind CSS" "${TAILWIND_URL}" "${TAILWIND_JS}"
download_asset "Lucide Icons" "${LUCIDE_URL}" "${LUCIDE_JS}"
download_asset "Mermaid.js" "${MERMAID_URL}" "${MERMAID_JS}"

echo "  [injecting]  Bundling CDN scripts into ${OUT_HTML} using awk..."

awk -v tw_file="${TAILWIND_JS}" -v lc_file="${LUCIDE_JS}" -v mm_file="${MERMAID_JS}" '
/<script[[:space:]]+src="https:\/\/cdn\.tailwindcss\.com"><\/script>/ {
    print "    <script>"
    print "/* Inlined Tailwind CSS (Offline Standalone) */"
    while ((getline line < tw_file) > 0) {
        print line
    }
    close(tw_file)
    print "    </script>"
    next
}
/<script[[:space:]]+src="https:\/\/unpkg\.com\/lucide@latest"><\/script>/ {
    print "    <script>"
    print "/* Inlined Lucide Icons (Offline Standalone) */"
    while ((getline line < lc_file) > 0) {
        print line
    }
    close(lc_file)
    print "    </script>"
    next
}
/<script[[:space:]]+src="https:\/\/cdn\.jsdelivr\.net\/npm\/mermaid@11\/dist\/mermaid\.min\.js"><\/script>/ {
    print "    <script>"
    print "/* Inlined Mermaid.js (Offline Standalone) */"
    while ((getline line < mm_file) > 0) {
        print line
    }
    close(mm_file)
    print "    </script>"
    next
}
{ print }
' "${SRC_HTML}" > "${OUT_HTML}"

echo "====================================================="
echo " Build successful!"
echo " Output file: ${OUT_HTML} ($(du -h "${OUT_HTML}" | cut -f1))"
echo " Fully self-contained single file ready for offline use."
echo "====================================================="
