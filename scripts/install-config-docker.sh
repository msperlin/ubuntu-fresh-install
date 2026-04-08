#!/bin/bash
set -euo pipefail

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove -y $pkg || true; done

sudo deb-get install docker-ce

sudo groupadd docker || true
sudo usermod -aG docker $USER
