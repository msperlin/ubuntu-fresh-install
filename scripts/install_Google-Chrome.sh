#!/bin/bash
#set -euo pipefail

echo "  - Installing Google Chrome"

# Auto-accept mscorefonts EULA to prevent interactive copyright questions
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections

sudo DEBIAN_FRONTEND=noninteractive deb-get install google-chrome-stable

