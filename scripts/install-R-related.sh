#!/bin/bash
ubuntu_codename=$(lsb_release -cs)

gpg --keyserver keyserver.ubuntu.com \
    --recv-key '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7'
    
gpg --armor --export '95C0FAF38DB3CCAD0C080A7BDC78B2DDEABC47B7' | \
    sudo tee /etc/apt/trusted.gpg.d/cran_debian_key.asc

echo "deb http://cloud.r-project.org/bin/linux/debian ${ubuntu_codename}-cran40/" | sudo tee -a /etc/apt/sources.list

sudo apt update
sudo apt install r-base r-base-dev -y

# install rstudio
# 1. Install Dependencies
echo "Installing prerequisites..."
sudo apt update -qq
sudo apt install -y gdebi-core curl wget

# 2. Define the "Latest" Redirect URL
# This URL always points to the latest stable build for Ubuntu/Debian
# "jammy" is the codename used for the latest Debian 11/12 compatible builds
LATEST_URL="https://rstudio.org/download/latest/stable/desktop/jammy/rstudio-latest-amd64.deb"

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
