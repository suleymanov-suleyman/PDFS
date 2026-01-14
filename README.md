# PDFS

CLI tool to capture PDF pages to clipboard or save as images.

## Description

PDFS is a lightweight command-line utility for Linux designed to extract specific pages from PDF files as high-resolution images. It streamlines the workflow of capturing lecture notes or document pages by allowing users to copy them directly to the clipboard or save them to a local directory efficiently.

The tool includes session management to save frequently used directories and automatically detects numbered PDF files for quick access.

## Features

- **CLI Workflow:** Operates entirely within the terminal without requiring a GUI.
- **Clipboard & File Support:** Copy page screenshots directly to the clipboard or save them to disk (`~/Photos/pdfs`).
- **Session Management:** Save and recall working directories using ID numbers.
- **Smart Selection:** Automatically filters and lists PDF files starting with numerical prefixes.
- **Configurable Defaults:** Set a persistent default action (Copy vs. Save) for your workflow.

## Requirements

- Linux
- poppler-utils
- wl-clipboard

## Installation

Clone the repository and run the included installer script. This will check for dependencies and install the tool to your system path.

```bash
git clone [https://github.com/suleymanov-suleyman/PDFS.git](https://github.com/suleymanov-suleyman/PDFS.git)
cd PDFS
chmod +x install.sh  
./install.sh
