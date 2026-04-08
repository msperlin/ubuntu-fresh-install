#!/bin/bash
set -euo pipefail

name_repo="ubuntu-fresh-install"

sudo apt install git -y

cd "/home/$USER/Downloads" || exit
rm -rf "$name_repo"

# use https for cloning (ssh doesnt work)
git clone "https://github.com/msperlin/$name_repo.git"

cd "$name_repo" || exit

bash setup-with-whiptail.sh
