#!/bin/bash

# Setup script untuk Termux/Linux
# Menginstall dependencies yang diperlukan

echo "Setting up CANGCUT..."

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    OS="unknown"
fi

echo "Detected OS: $OS"

# Install untuk Termux
if [ -n "$TERMUX_VERSION" ] || [ -d "$PREFIX" ]; then
    echo "Installing for Termux..."
    pkg update -y
    pkg install -y \
        coreutils \
        grep \
        sed \
        gawk \
        curl \
        wget \
        git \
        python \
        openssh \
        net-tools
fi

# Install untuk Debian/Ubuntu
if [[ "$OS" == "debian" ]] || [[ "$OS" == "ubuntu" ]]; then
    echo "Installing for Debian/Ubuntu..."
    sudo apt-get update
    sudo apt-get install -y \
        coreutils \
        grep \
        sed \
        gawk \
        curl \
        wget \
        git \
        python3 \
        openssh-client \
        net-tools \
        dnsutils
fi

# Install untuk Alpine
if [[ "$OS" == "alpine" ]]; then
    echo "Installing for Alpine..."
    apk add --no-cache \
        coreutils \
        grep \
        sed \
        gawk \
        curl \
        wget \
        git \
        python3 \
        openssh-client \
        net-tools
fi

echo "Setup complete!"
