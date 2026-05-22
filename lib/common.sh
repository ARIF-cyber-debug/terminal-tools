#!/bin/bash

# Common functions library
# Fungsi-fungsi umum yang digunakan oleh berbagai tools

# Color codes
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export MAGENTA='\033[0;35m'
export CYAN='\033[0;36m'
export NC='\033[0m'

# Print functions
print_header() {
    echo -e "${BLUE}╔═══════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC} $1"
    echo -e "${BLUE}╚═══════════════════════════════════════════════╝${NC}"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if running as root
is_root() {
    [ "$EUID" -eq 0 ]
}

# Get current user
get_user() {
    if [ -n "$SUDO_USER" ]; then
        echo "$SUDO_USER"
    else
        echo "$USER"
    fi
}

# Get script directory
get_script_dir() {
    echo "$( cd "$( dirname "${BASH_SOURCE[1]}" )" && pwd )"
}

# Show spinner
show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Format bytes to human readable
format_bytes() {
    local bytes=$1
    if (( bytes < 1024 )); then
        echo "${bytes}B"
    elif (( bytes < 1048576 )); then
        echo "$((bytes / 1024))KB"
    elif (( bytes < 1073741824 )); then
        echo "$((bytes / 1048576))MB"
    else
        echo "$((bytes / 1073741824))GB"
    fi
}

# Check internet connection
check_internet() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1
    return $?
}

# Save config
save_config() {
    local key=$1
    local value=$2
    local config_file="$HOME/.cangcut/config.conf"
    mkdir -p "$HOME/.cangcut"
    echo "$key=$value" >> "$config_file"
}

# Load config
load_config() {
    local key=$1
    local config_file="$HOME/.cangcut/config.conf"
    if [ -f "$config_file" ]; then
        grep "^$key=" "$config_file" | cut -d= -f2
    fi
}

# Log message
log_message() {
    local level=$1
    local message=$2
    local log_file="$HOME/.cangcut/cangcut.log"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $message" >> "$log_file"
}

export -f print_header
export -f print_success
export -f print_error
export -f print_info
export -f print_warning
export -f command_exists
export -f is_root
export -f get_user
export -f get_script_dir
export -f show_spinner
export -f format_bytes
export -f check_internet
export -f save_config
export -f load_config
export -f log_message
