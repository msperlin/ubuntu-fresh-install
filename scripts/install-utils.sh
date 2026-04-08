#!/bin/bash
set -euo pipefail

sudo apt install -y okular libreoffice git

# install gh
if ! type -p wget >/dev/null; then
    sudo apt update && sudo apt install wget -y
fi

sudo mkdir -p -m 755 /etc/apt/keyrings
out=$(mktemp)
wget -nv -O"$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg
sudo mv "$out" /etc/apt/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
sudo mkdir -p -m 755 /etc/apt/sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y

# pacstall
sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install)"

# install topgrade
pacstall -I topgrade-bin