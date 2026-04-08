#!/bin/bash
set -euo pipefail

# install R itself

# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the repo from CRAN -- lsb_release adjusts to 'noble' or 'jammy' or ... as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt install r-base r-base-dev -y

# install rstudio
# 1. Install Dependencies
echo "Installing prerequisites..."
sudo apt update -qq
sudo apt install -y gdebi-core curl wget

# 2. Define the "Latest" Redirect URL
# This URL always points to the latest stable build for Ubuntu/Debian
LATEST_URL="https://rstudio.org/download/latest/stable/desktop/noble/rstudio-latest-amd64.deb"

# 3. Scrape the Version Number
# We use 'curl -I' (head request) to see where the link redirects to
# Then use grep/sed to extract the filename from the "Location:" header
echo "Checking for latest version..."
REDIRECT_URL=$(curl -sI "$LATEST_URL" | grep -i "location:" | awk '{print $2}' | tr -d '\r')

if [ -z "$REDIRECT_URL" ]; then
    echo "Error: Could not determine latest version URL."
    exit 1
fi

# Extract just the filename (e.g., rstudio-2024.09.1-394-amd64.deb)
FILE_NAME=$(basename "$REDIRECT_URL")
echo "Found latest version: $FILE_NAME"

# 4. Download
echo "Downloading..."
wget -q --show-progress "$REDIRECT_URL" -O "$FILE_NAME"

# 5. Install
echo "Installing with gdebi..."
sudo gdebi -n "$FILE_NAME"

# 6. Cleanup
rm "$FILE_NAME"
echo "Done! R and RStudio are ready to use."
