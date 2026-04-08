#!/bin/bash
set -euo pipefail

# --- Main Execution ---
apt_file="apt-to-install.txt"

# initial steps
# make all scripts executable
chmod +x scripts/*.sh

update_system() {
    sudo apt update && sudo apt upgrade -y
    if command -v deb-get &> /dev/null; then
        sudo deb-get update
    fi
}

install_deb_get() {
    if ! command -v deb-get &> /dev/null; then
        echo "deb-get not found. Installing..."
        curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo bash -s install deb-get
    fi
}

install_apt_software() {
    xargs -a "$apt_file" sudo apt install -y
}

cleanup() {
    sudo apt autoremove -y
}


# Check for whiptail
if ! command -v whiptail &> /dev/null; then
    echo "whiptail not found. Installing..."
    sudo apt install whiptail -y
fi

# Ensure deb-get is installed
install_deb_get

echo "=== UBUNTU Setup Script ==="

CHOICES=$(whiptail --title "Ubuntu Setup" --checklist \
"Select components to install (Space to select, Enter to confirm):" 22 78 14 \
"UPDATE" "Update and Upgrade System" ON \
"APT" "Install apt software in $apt_file" OFF \
"UTILS" "Install utils (gh,topgrade, ..)" OFF \
"STEAM" "Install Steam" OFF \
"CHROME" "Install Google Chrome" OFF \
"TEXLIVE" "Install texlive packages" OFF \
"R_PKG" "Install R-related packages" OFF \
"PYTHON" "Install Python related packages" OFF \
"VSCODE" "Install vscode" OFF \
"GIT" "Configure git username and email" OFF \
"DOCKER" "Install Docker" OFF \
"INSYNC" "Install Insync (Google Drive client)" OFF \
"CLEANUP" "Run System Cleanup" OFF \
3>&1 1>&2 2>&3)

if [ $? -eq 0 ]; then
    for CHOICE in $CHOICES; do
        case "$CHOICE" in
            '"UPDATE"') update_system ;;
            '"APT"') install_apt_software ;;
            '"UTILS"') ./scripts/install-utils.sh ;;
            '"STEAM"') ./scripts/install-steam.sh ;;
            '"CHROME"') ./scripts/install_Google-Chrome.sh ;;
            '"TEXLIVE"') ./scripts/install-texlive.sh ;;
            '"R_PKG"') ./scripts/install-R-related.sh ;;
            '"PYTHON"') ./scripts/install-python-related.sh ;;
            '"VSCODE"') ./scripts/install-vscode.sh ;;
            '"GIT"') ./scripts/configure-git.sh ;;
            '"DOCKER"') ./scripts/install-config-docker.sh ;;
            '"INSYNC"') ./scripts/install-insync.sh ;;
            '"CLEANUP"') cleanup ;;
        esac
    done
    echo "=== Setup Complete! ==="
    echo "Please restart your session to apply major changes."
else
    echo "Setup cancelled."
fi
