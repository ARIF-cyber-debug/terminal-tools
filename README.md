# CANGCUT - Terminal Tools Collection

🔧 Koleksi lengkap tools untuk terminal yang dapat dijalankan di **Termux, Linux, dan sistem Unix-like** lainnya.

## 📋 Daftar Kategori Tools

### 1. 🖥️ **System Tools**
- Cleanup & Optimization
- System Monitoring
- Disk Management
- Process Management
- Performance Analysis

### 2. 🌐 **Networking Tools**
- IP Address Utilities
- Port Scanning
- Network Testing
- DNS Tools
- Connection Monitoring

### 3. 🔒 **Security Tools**
- Password Generator
- Hash Generator
- Encryption/Decryption
- File Integrity Checker
- Network Security

### 4. 📁 **File Management**
- Batch Rename
- Compression Utilities
- Backup Tools
- Duplicate File Finder
- File Organization

### 5. 💻 **Development Tools**
- Code Formatter
- Git Helpers
- Build Automation
- Code Metrics
- Development Utilities

### 6. 🤖 **Automation Tools**
- Task Scheduler
- Batch Processing
- Script Generators
- Workflow Automation

### 7. 📊 **Data Tools**
- Data Converter
- Text Processing
- JSON/CSV Handler
- Data Analysis

### 8. 🎯 **Termux Specific**
- Termux Optimizer
- Package Manager Helper
- Storage Access Setup
- Performance Tweaks

## 🚀 Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/ARIF-cyber-debug/terminal-tools.git
cd terminal-tools

# Make all scripts executable
chmod +x install.sh
chmod +x -R tools/*/

# Run installer
./install.sh
```

### Usage

Setiap tool memiliki dokumentasi sendiri di folder masing-masing.

```bash
# Contoh menjalankan tool
./tools/system/cleanup.sh
./tools/network/ip-scanner.sh
./tools/security/password-gen.sh
```

## 📁 Struktur Directory

```
cangcut/
├── README.md
├── install.sh
├── setup.sh
├── config/
│   ├── config.conf
│   ├── aliases.sh
│   └── termux-config.conf
├── tools/
│   ├── system/
│   ├── network/
│   ├── security/
│   ├── files/
│   ├── development/
│   ├── automation/
│   ├── data/
│   └── termux/
├── bin/
│   └── (symlinks ke semua tools)
├── docs/
│   └── (dokumentasi lengkap)
└── lib/
    └── (shared functions)
```

## ✨ Features

✅ **Universal Compatibility** - Bekerja di Termux, Linux, macOS, WSL
✅ **No Dependencies** - Menggunakan tools bawaan sistem
✅ **Easy Installation** - Auto-setup script
✅ **Full Documentation** - Setiap tool memiliki help built-in
✅ **Modular Design** - Gunakan hanya yang dibutuhkan
✅ **Beginner Friendly** - Dokumentasi lengkap dalam Bahasa Indonesia
✅ **Active Development** - Update teratur dengan tools baru

## 🎯 Requirements

- Bash/Shell (sudah built-in di Linux & Termux)
- Coreutils (grep, sed, awk, etc)
- Net-tools (optional untuk network tools)
- Python 3 (optional untuk beberapa tools)

## 📚 Documentation

Setiap folder tools memiliki:
- `README.md` - Dokumentasi lengkap
- `*.sh` - Script executable
- `example/` - Contoh penggunaan

## 🔧 Configuration

Edit file `config/config.conf` untuk mengatur preferensi global.

## 🤝 Contributing

Silakan fork dan submit pull request untuk menambah tools baru!

## 📄 License

MIT License - Bebas digunakan untuk keperluan apapun

## 👤 Author

ARIF-cyber-debug

---

**Happy Hacking!** 🎉
