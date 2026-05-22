#!/bin/bash

# CANGCUT - Terminal Tools Installer
# Installation script untuk semua tools

set -e

echo "╔════════════════════════════════════════════════╗"
echo "║     CANGCUT - Terminal Tools Installer         ║"
echo "║     Universal Tools for All Terminals          ║"
echo "╚════════════════════════════════════════════════╝"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Installation paths
if [ "$EUID" -eq 0 ]; then
    INSTALL_PATH="/usr/local/bin"
else
    INSTALL_PATH="$HOME/.local/bin"
    mkdir -p "$INSTALL_PATH"
fi

echo -e "${BLUE}[*] Installation Path: $INSTALL_PATH${NC}"
echo ""

# Make scripts executable
echo -e "${BLUE}[*] Making scripts executable...${NC}"
find "$SCRIPT_DIR/tools" -name "*.sh" -type f -exec chmod +x {} \;
echo -e "${GREEN}[✓] Scripts are now executable${NC}"
echo ""

# Create symlinks
echo -e "${BLUE}[*] Creating command symlinks...${NC}"

for tool_dir in "$SCRIPT_DIR/tools"/*; do
    if [ -d "$tool_dir" ]; then
        category=$(basename "$tool_dir")
        for script in "$tool_dir"/*.sh; do
            if [ -f "$script" ]; then
                scriptname=$(basename "$script" .sh)
                if [ "$scriptname" != "README" ]; then
                    # Create symlink
                    sudo ln -sf "$script" "$INSTALL_PATH/$scriptname" 2>/dev/null || \
                    ln -sf "$script" "$INSTALL_PATH/$scriptname"
                    echo -e "${GREEN}[✓]${NC} $scriptname"
                fi
            fi
        done
    fi
done

echo ""
echo -e "${BLUE}[*] Setting up configuration files...${NC}"
mkdir -p "$HOME/.cangcut"
cp -r "$SCRIPT_DIR/config"/* "$HOME/.cangcut/" 2>/dev/null || true
echo -e "${GREEN}[✓] Configuration directory created${NC}"
echo ""

# Add to PATH if needed
echo -e "${BLUE}[*] Checking PATH...${NC}"

if [[ ":$PATH:" != *":$INSTALL_PATH:"* ]]; then
    echo -e "${YELLOW}[!] Adding $INSTALL_PATH to PATH${NC}"
    
    # Detect shell
    SHELL_RC=""
    if [ -f "$HOME/.bashrc" ]; then
        SHELL_RC="$HOME/.bashrc"
    elif [ -f "$HOME/.zshrc" ]; then
        SHELL_RC="$HOME/.zshrc"
    fi
    
    if [ -n "$SHELL_RC" ]; then
        echo "export PATH=\"$INSTALL_PATH:\$PATH\"" >> "$SHELL_RC"
        echo -e "${GREEN}[✓] PATH updated in $SHELL_RC${NC}"
    fi
else
    echo -e "${GREEN}[✓] $INSTALL_PATH already in PATH${NC}"
fi

echo ""
echo "╔════════════════════════════════════════════════╗"
echo -e "║  ${GREEN}Installation Complete!${NC}                          ║"
echo "╚════════════════════════════════════════════════╝"
echo ""
echo -e "${BLUE}Usage:${NC}"
echo "  • Type any tool name to run it"
echo "  • Example: cleanup, ip-scanner, password-gen"
echo -e "${BLUE}Help:${NC}"
echo "  • toolname -h or toolname --help"
echo ""
echo -e "${GREEN}All tools are ready to use!${NC}"
echo ""
