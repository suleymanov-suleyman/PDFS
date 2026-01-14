```md
# PDFS – PDF Screenshooter

## Overview
- Name: **PDFS**
- Type: Command-line utility
- Language: Bash
- Platform: Linux
- Display protocol: Wayland
- Purpose:
  - Extract single pages from PDF files
  - Render pages as high-quality images
  - Copy images to clipboard or save to disk
- Target usage:
  - Lecture notes
  - Course materials
  - Ordered book chapters

---

## Key Characteristics
- Fully terminal-based
- No GUI dependencies
- Fast, minimal workflow
- Optimized for sequential PDF collections

---

## Features
- CLI-driven interaction
- Page-level PDF rendering
- 300 DPI image output
- Clipboard copy support
- Disk save support
- Session-based directory management
- Persistent default behavior
- Automatic filtering of numbered PDFs

---

## Requirements
- Operating system:
  - Linux
- Required packages:
  - `poppler-utils`
    - provides `pdftoppm`
  - `wl-clipboard`
    - provides `wl-copy`
- Environment:
  - Wayland session required for clipboard support

---

## Installation

### Automated Installer (Recommended)
- Responsibilities:
  - Dependency checking
  - Package installation (Fedora / DNF)
  - Permission setup
  - System-wide install
- Commands:
  - `git clone https://github.com/suleymanov-suleyman/PDFS.git`
  - `cd PDFS`
  - `./install.sh`
- Result:
  - `pdfs` available in system PATH

---

### Manual Installation

#### Install Dependencies
- Command:
  - `sudo dnf install poppler-utils wl-clipboard`

#### Install Binary
- Commands:
  - `chmod +x pdfs`
  - `sudo cp pdfs /usr/local/bin/pdfs`

---

## Core Concepts

### Session System
- Goal:
  - Reduce repetitive path input
  - Speed up navigation

#### Temporary Session
- Started by:
  - `pdfs [path]`
- Behavior:
  - Path not saved
  - Session ends on exit

#### Saved Session
- Started by:
  - `pdfs -s [path]`
- Behavior:
  - Path stored persistently
  - Numeric ID assigned
  - Accessible via menu

---

## File Recognition Logic

### Rule
- Only PDF files starting with digits `0–9` are listed

### Reasoning
- Ensures correct ordering
- Matches academic material structure
- Prevents unrelated files from appearing

### Visibility Examples
- Visible:
  - `01_Intro.pdf`
  - `2_DataStructures.pdf`
- Ignored:
  - `Syllabus.pdf`
  - `Notes.pdf`

---

## CLI Usage

### Startup Modes
- `pdfs`
  - Open saved session menu
- `pdfs [path]`
  - Start temporary session
- `pdfs -s [path]`
  - Save session and start
- `pdfs -d`
  - Delete saved session
- `pdfs -default`
  - Configure default page action
- `pdfs -h`
  - Display help

### Example
- `pdfs -s ~/Documents/University/CS102`

---

## Interactive Session Workflow

### File Selection
- Lists numbered PDFs
- Select by numeric prefix or filename start

### Page Selection Loop
- Input format:
  - `[PageNumber] [OptionalFlag]`

### Actions
- Default action:
  - Input: `42`
  - Uses configured mode
- Force save:
  - Input: `42 -s`
  - Output: `~/Photos/pdfs`
- Force copy:
  - Input: `42 -c`
- Return to file list:
  - Input: `q`

---

## Configuration & File Structure

### Configuration Directory
- Path:
  - `~/.config/pdfs/`

#### Configuration Files
- `sessions.txt`
  - Format: `ID|PATH`
  - Stores saved sessions
- `settings.conf`
  - Stores default mode
  - Values:
    - `mode=copy`
    - `mode=save`

### Output Directory
- Path:
  - `~/Photos/pdfs/`
- File naming:
  - `Filename_p<PageNumber>.png`

---

## Technical Details

### Rendering
- Tool:
  - `pdftoppm`
- Resolution:
  - 300 DPI
- Output format:
  - PNG

### Clipboard
- Tool:
  - `wl-copy`
- MIME type:
  - `image/png`
- Scope:
  - Wayland only

---

## Troubleshooting

### No Numbered PDFs Found
- Cause:
  - Filenames without numeric prefix
- Fix:
  - Rename files to start with digits

---

### Missing Dependencies
- Indicators:
  - `Missing: poppler-utils`
  - `Missing: wl-clipboard`
- Fix:
  - Install required packages

---

### Permission Denied
- Cause:
  - Non-executable binary
- Fix:
  - `chmod +x /usr/local/bin/pdfs`

---

## License
- GPL
```
