# 🚀 Ubuntu Fresh Install

![Ubuntu Setup Banner](assets/banner.png)

A modular and interactive Bash utility designed to automate the post-installation setup for Ubuntu systems. This script provides a streamlined, menu-driven interface using `whiptail` to easily select, configure, and install your essential software stack.

---

## ⚡ Quick Start

Get your system up and running with a single command:

```bash
curl -sL https://raw.githubusercontent.com/msperlin/ubuntu-fresh-install/main/installer.sh | bash
```

> [!NOTE]
> This command will clone the repository to your `~/Downloads` folder and launch the interactive setup menu.

---

## ✨ Features & Modules

The interactive menu allows you to selectively execute the following tasks:

### 🛠️ Core System
- **System Update:** Full `apt update` and `apt upgrade`.
- **System Cleanup:** Automated `apt autoremove` to keep your system lean.

### 📦 Essential Packages
- **APT Selection:** Installs basic software defined in `apt-to-install.txt`.
- **deb-get integration:** Uses `deb-get` to install and manage third-party software (Chrome, VS Code, Docker, etc.) ensuring the latest versions.
- **Modern Utils:** Installs modern CLI tools like `gh` (GitHub CLI), `pacstall`, and `topgrade`.

### 📊 Data Science & Development
- **R Environment:** Installs **R Base**, `r-base-dev`, and the latest stable **RStudio Desktop**.
- **Python Suite:** Sets up a robust Python environment using `pyenv` for version management and `uv` for fast package handling.
- **TeX Live:** Complete TeX Live packages for professional document production.

### 💻 Developer Tools
- **Visual Studio Code:** The industry-standard code editor.
- **Docker:** Automated installation and configuration of the Docker engine.
- **Git Configuration:** Quick setup for your global Git identity (username and email).

### 🌐 Productivity & Apps
- **Google Chrome:** The most popular web browser.
- **Insync:** Powerful Google Drive & OneDrive client for Linux.
- **Steam:** Ready for Linux gaming.

---

## 🔧 Customization

You can easily customize the base packages by editing the `apt-to-install.txt` file before running the setup:

```text
# Example apt-to-install.txt
htop
curl
git
ffmpeg
keepass2
```

Simply add or remove package names (one per line) to tailor the installation to your needs.

---

## 📋 Prerequisites

- **OS:** Ubuntu or Debian-based distributions (tested extensively on **Kubuntu 24.04**).
- **Privileges:** `sudo` access is required for package installations and system modifications.
- **Internet:** An active connection is required to download packages and scripts.

---

## 🎓 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

Developed with ❤️ by [Marcelo S. Perlin](https://github.com/msperlin)