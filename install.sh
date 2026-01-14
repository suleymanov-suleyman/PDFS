#!/bin/bash

# ==============================================================================
# Project: PDFS Installer
# Description: Installs PDFS tool and dependencies on Linux.
# ==============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}=== PDFS Installer ===${NC}"

if [ ! -f "pdfs" ]; then
    echo -e "${RED}[ERROR] 'pdfs' file not found!${NC}"
    echo "Please run this script inside the folder containing 'pdfs'."
    exit 1
fi

echo -e "${YELLOW}Checking dependencies...${NC}"

PACKAGES="poppler-utils wl-clipboard"
NEEDS_INSTALL=0

for pkg in $PACKAGES; do
    if ! rpm -q $pkg &> /dev/null; then
        echo -e "${RED}Missing: $pkg${NC}"
        NEEDS_INSTALL=1
    else
        echo -e "${GREEN}Found: $pkg${NC}"
    fi
done

if [ $NEEDS_INSTALL -eq 1 ]; then
    echo -e "${YELLOW}Installing missing packages (sudo required)...${NC}"
    sudo dnf install -y $PACKAGES
    
    if [ $? -ne 0 ]; then
        echo -e "${RED}[ERROR] Installation failed.${NC}"
        exit 1
    fi
    echo -e "${GREEN}Dependencies installed.${NC}"
else
    echo -e "${GREEN}All dependencies met.${NC}"
fi

echo -e "${YELLOW}Installing PDFS to system...${NC}"

chmod +x pdfs
sudo cp pdfs /usr/local/bin/pdfs

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Success!${NC}"
    echo -e "You can now use ${BLUE}pdfs${NC} command anywhere."
else
    echo -e "${RED}[ERROR] Copy failed.${NC}"
    exit 1
fi
