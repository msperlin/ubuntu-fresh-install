#!/bin/bash

# 1. Ensure curl and gpg are installed
sudo apt-get install -y curl gpg

# 2. Add the Insync GPG key (handling the deprecated apt-key warning)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key | sudo gpg --dearmor -o /etc/apt/keyrings/insync-archive-keyring.gpg --yes

# 3. Add the Insync repository to sources.list.d
echo "deb http://apt.insync.io/ubuntu $(lsb_release -cs) non-free contrib" | sudo tee /etc/apt/sources.list.d/insync.list

# 4. Update and Install Insync
sudo apt-get update
sudo apt-get install -y insync

# 5. Optional: Install File Manager Integration (Uncomment your desktop environment)
# KDE (Plasma):
sudo apt-get install -y insync-dolphin

# 6. Start Insync (this will trigger the login window if not headless)
echo "Installation complete. Starting Insync..."
insync start &