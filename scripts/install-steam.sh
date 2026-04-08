#!/bin/bash
set -euo pipefail

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt install -y steam-installer

sudo apt install -y libgl1-mesa-dri:i386 libgl1:i386
sudo apt-get upgrade -y steam -f
sudo apt install -y nvidia-driver-libs:i386
