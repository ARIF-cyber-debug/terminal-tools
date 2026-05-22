#!/bin/bash

# CANGCUT Aliases
# Tambahkan ke ~/.bashrc atau ~/.zshrc

# System
alias sys-clean='cleanup'
alias sys-monitor='system-monitor'
alias disk-usage='disk-analyzer'
alias process-list='process-viewer'

# Network
alias net-scan='ip-scanner'
alias port-scan='port-scanner'
alias net-test='network-tester'
alias dns-query='dns-lookup'
alias ip-info='ip-information'

# Security
alias gen-pass='password-gen'
alias gen-hash='hash-generator'
alias check-hash='hash-checker'
alias file-hash='file-hasher'

# Files
alias batch-rename='batch-rename-tool'
alias find-dups='duplicate-finder'
alias backup-dir='backup-manager'
alias compress-files='compression-tool'

# Development
alias format-code='code-formatter'
alias git-helper='git-tool'
alias build-auto='build-automation'

# Data
alias convert-data='data-converter'
alias parse-json='json-parser'
alias parse-csv='csv-parser'

# Termux
alias termux-opt='termux-optimizer'
alias termux-storage='storage-setup'
alias pkg-helper='package-helper'

# Quick access
alias cangcut-dir='cd ~/.cangcut'
alias cangcut-list='ls ~/.local/bin | grep -v cangcut'
alias cangcut-update='cd $(dirname $(readlink -f $0)) && git pull'
