#!/bin/bash
set -euo pipefail

sudo apt install -y okular git
sudo deb-get install libreoffice pandoc

# install gh
sudo deb-get install gh

# pacstall
sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)"

# install topgrade
pacstall -I topgrade-bin