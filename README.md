# Garis Diagram Editor

An interactive, browser-native Mermaid diagram editor and visualizer contained within a **single standalone HTML file**. Create, preview, manage, and export diagrams in real time without Node.js, npm, build steps, external servers, or account registration.

Supports **all Mermaid diagram families**: Flowcharts, Sequence Diagrams, Mindmaps, Class Diagrams, State Machines, Entity-Relationship (ER) models, Git Graphs, and more.

---

## Table of Contents

- [Overview](#overview)
- [How to Run (Standalone Mode)](#how-to-run-standalone-mode)
- [How to Use](#how-to-use)
- [Key Features](#key-features)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [Tech Stack](#tech-stack)
- [Offline Standalone Build](#offline-standalone-build)
- [Project Structure](#project-structure)
- [Changelog](#changelog)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## Overview

**Garis Diagram Editor** is a 100% client-side, zero-build tool designed for software engineers, systems architects, and technical writers. Everything—the code editor, live SVG diagram renderer, interactive pan/zoom canvas, LocalStorage library with autosave, boot-time configuration persistence, and multi-format export engine—runs entirely in your browser inside one portable file: `index.html`.

---

## How to Run (Standalone Mode)

There is **no installation, no npm packages, and no build step** required.

### 1. Download or Clone

Download [`index.html`](index.html) directly, or clone the repository:

```bash
git clone https://github.com/rioastamal/garis-diagram-editor.git
cd garis-diagram-editor
```

### 2. Open in Any Modern Browser

Simply double-click `index.html` in your file explorer, or launch it via the terminal:

```bash
# macOS
open index.html

# Linux
xdg-open index.html

# Windows
start index.html
```

---

## How to Use

1. **Write Diagram Code**:
   - Type or paste any valid Mermaid diagram syntax into the code editor on the left pane (`flowchart TD`, `sequenceDiagram`, `mindmap`, `classDiagram`, `stateDiagram-v2`, `erDiagram`, `gitGraph`, etc.).
   - Live validation runs continuously on keystroke. If you make a syntax error, a contextual banner alerts you while keeping your last valid diagram rendered.

2. **Navigate the Canvas**:
   - **Pan**: Click and drag anywhere on the canvas or drag with touch on mobile.
   - **Zoom**: Scroll your mouse wheel, pinch on your trackpad/touchscreen, or use the floating zoom controls (`+`, `-`, `Reset`, `Fit to Screen`).

3. **Customize Appearance**:
   - **Themes**: Switch between `Default`, `Dark`, `Forest`, `Neutral`, `Base`, and `Monokai`.
   - **Canvas Backgrounds**: Choose `Pure White`, `Light Slate`, `Dark Slate`, `Monokai`, or `Transparent Checkerboard`.
   - **Grid**: Toggle the subtle canvas background dot-grid on or off.

4. **Automatic Boot Configuration**:
   - Your preferences—including the last selected **Theme**, **Canvas Background**, **Zoom scale**, **Pan coordinates**, **Grid state**, **Layout mode**, and **Editor split**—are automatically remembered and loaded at boot time.

5. **Save & Autosave (LocalStorage & file:// Safe Storage)**:
   - Save your diagram to LocalStorage using the **Save** button or <kbd>Ctrl</kbd> + <kbd>S</kbd> / <kbd>Cmd</kbd> + <kbd>S</kbd>.
   - **Offline `file://` Safe Fallback**: When opened directly from disk via `file://` protocol, browser security sandboxes persistent LocalStorage. The built-in Safe Storage wrapper catches this gracefully, maintains an in-memory session store, and triggers an automatic direct download of the diagram as a `.mmd` file to your computer.
   - **Autosave**: Once saved, any subsequent code, theme, or background edits are automatically saved in the background after an 800ms debounce. You can toggle Autosave on/off at any time from the main menu.
   - Open **Load Saved Diagrams** from the menu to search, load, duplicate, rename, download `.mmd`, or delete saved diagrams.
   - **Direct File Import & Drag-and-Drop**: You can open `.mmd`, `.mermaid`, or `.txt` files directly from disk via "Open Diagram File..." or by dragging and dropping them straight onto the editor.

6. **Export & File Sharing**:
   - **Quick PNG**: Click the Quick Download icon for an instant 2x PNG download.
   - **Custom Export**: Open the Export dialog to choose image resolution (`1x`, `2x`, `3x`, `4x`) and background color (`White`, `Dark`, `Transparent`, `Monokai`).
   - **Vector SVG**: Download scalable SVG vector files or copy raw SVG markup directly to your clipboard.
   - **Download .mmd**: Export raw Mermaid source code directly as a `.mmd` file from the main menu, Save dialog, Export dialog, or library cards.
   - **Copy Code**: Copy the Mermaid syntax directly to your clipboard.

> **Tip for `file://` usage**: When opening `index.html` or `dist/index.html` directly from disk via `file://`, modern browsers restrict persistent LocalStorage for security reasons. Garis handles this seamlessly by keeping diagrams in memory and downloading `.mmd` files directly to your computer. For persistent cross-session LocalStorage, you can also run a quick local HTTP server (e.g., `python3 -m http.server 3000` or `npx serve .`).

---

## Key Features

- **🚀 100% Standalone Single File**: Zero npm dependencies, no bundlers, no transpilers. Just open `index.html`.
- **📊 Comprehensive Diagram Support**: Flowcharts, Sequence Diagrams, Mindmaps, Class Diagrams, State Diagrams, Entity-Relationship Diagrams, Git Graphs, and more.
- **⚙️ Boot-Time State Restoration**: Automatically loads your last selected theme, canvas background, zoom magnification, pan offset, grid toggle, and layout split upon startup.
- **⚡ Real-Time Live Preview**: Instant diagram compilation with sub-100ms response times and live line/character metrics.
- **💾 LocalStorage Persistence & Autosave**:
  - Full local diagram library: save, load, duplicate, rename, and delete diagrams.
  - Automatic debounced background saving with live visual indicators.
  - Diagram state persists seamlessly across browser reloads.
- **🔍 Interactive Pan & Zoom Canvas**:
  - Smooth multi-directional pan dragging with mouse and mobile touch.
  - Mouse wheel and trackpad pinch zoom (20% to 350%).
  - One-click auto-fit to screen.
- **🎨 Comprehensive Theming**:
  - 6 Mermaid diagram themes: Default, Dark, Forest, Neutral, Base, and Monokai.
  - 5 canvas background presets, including transparent checkerboard and dark mode.
- **📐 Built-In Diagram Templates**:
  - Pre-loaded multi-diagram flows: User Onboarding Flowchart, Cloud Architecture Mindmap, Domain Model Class Diagram, Order State Machine, Database Schema ER Diagram, Gitflow Graph, OAuth 2.0 Sequence, Microservices RPC, and E-Commerce Payment.
- **📦 High-Resolution Multi-Format Export**:
  - High-DPI PNG rendering at 1x, 2x, 3x, or 4x pixel density.
  - Standalone SVG file download with embedded styles.
  - One-click clipboard copying for SVG markup and Mermaid source code.
- **📱 Responsive Layout**:
  - Clean split-pane layout with collapsible sidebar and a consolidated hamburger menu.
  - Optional toolbar pinning to keep favorite actions visible.

---

## Keyboard Shortcuts

| Shortcut | Action |
| :--- | :--- |
| <kbd>Ctrl</kbd> + <kbd>S</kbd> / <kbd>Cmd</kbd> + <kbd>S</kbd> | Save diagram to LocalStorage |
| <kbd>Tab</kbd> | Insert 2-space indentation |
| <kbd>Mouse Wheel</kbd> | Zoom in / Zoom out on canvas |
| <kbd>Click + Drag</kbd> | Pan diagram canvas |

---

## Tech Stack

- **Application**: Vanilla HTML5, CSS3, ES2022 JavaScript (no framework overhead)
- **Diagram Engine**: [Mermaid.js](https://mermaid.js.org/) (v11 loaded via CDN)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/) (loaded via CDN)
- **Iconography**: [Lucide Icons](https://lucide.dev/) (loaded via CDN)

---

## Offline Standalone Build

To generate a 100% offline self-contained HTML file with all CDN libraries (Tailwind CSS, Lucide Icons, and Mermaid.js) downloaded and inlined:

```bash
# Run the offline build script
./build.sh
```

The offline bundle will be created at `dist/index.html`. You can open this file in any browser without any internet connection.

---

## Project Structure

```text
.
├── index.html          # Source application (UI, styling, and logic)
├── build.sh            # Script to build 100% offline standalone bundle
├── dist/
│   └── index.html      # Compiled 100% offline standalone application
├── LICENSE             # MIT License
└── README.md           # Documentation
```

---

## Changelog

### v1.1
- **Mobile UI Optimization**: Hide "Untitled Diagram" title and save status badge on mobile viewports to prevent header clutter.
- **Mobile Pinch-to-Zoom Restriction**: Disabled mobile browser viewport pinch-to-zoom across the UI while preserving responsive pinch-zooming exclusively within the diagram canvas pane.
- **GitHub Repository Menu**: Added direct GitHub repository menu item under *About & Community* in the main tools menu.
- **Icon Rendering Fix**: Rendered GitHub icon with a native inline SVG mark.
- **Version Indicator**: Displayed diagram editor version (`v1.1`) under the GitHub menu linking to GitHub release notes.

### v1.0
- **Initial Release**: Standalone browser-native Mermaid diagram editor and visualizer in a single portable file (`index.html`).
- **Comprehensive Diagram Support**: Support for Flowcharts, Sequence Diagrams, Mindmaps, Class Diagrams, State Diagrams, ER Models, and Git Graphs.
- **Live Preview & Validation**: Real-time syntax validation, instant diagram compilation, and line/character count metrics.
- **Interactive Canvas**: Multi-directional mouse and touch panning, zoom controls (20% to 350%), fit-to-screen, and customizable canvas grid.
- **Theming & Backgrounds**: 6 Mermaid themes (Default, Dark, Forest, Neutral, Base, Monokai) and 5 canvas background presets.
- **LocalStorage & Autosave**: Local diagram management (save, load, duplicate, rename, delete) with debounced background autosaving.
- **Offline `file://` Protocol Fallback**: In-memory session store and direct `.mmd` file export when opened directly from disk.
- **Multi-Format Export**: High-DPI PNG export (1x–4x), scalable vector SVG download/copy, and raw `.mmd` source file download.
- **Starter Templates**: Pre-loaded diagrams for software architectures, workflows, and state machines.
- **Offline Build Tooling**: Added `build.sh` script to inline all dependencies into a standalone offline `dist/index.html`.

---

## Contributing

Contributions are welcome! If you'd like to improve the visualizer, submit a new template, or optimize rendering:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/new-template`).
3. Commit your changes (`git commit -m 'Add new cloud architecture template'`).
4. Push to the branch (`git push origin feature/new-template`).
5. Open a Pull Request.

---

## License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for details.

---

## Acknowledgments

- [Mermaid.js](https://mermaid.js.org/) for the multi-diagram parsing and SVG rendering engine.
- [Lucide](https://lucide.dev/) for clean UI icons.
- [Tailwind CSS](https://tailwindcss.com/) for utility styling.
