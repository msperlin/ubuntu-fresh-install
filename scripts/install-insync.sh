#!/bin/bash
set -euo pipefail

sudo deb-get install insync

# 5. Optional: Install File Manager Integration (Uncomment your desktop environment)
# KDE (Plasma):
sudo apt-get install -y insync-dolphin

# 6. Start Insync (this will trigger the login window if not headless)
echo "Installation complete. Starting Insync..."
insync start &