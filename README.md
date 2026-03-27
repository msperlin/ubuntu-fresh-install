# Ubuntu Fresh Install Setup

A Bash utility designed to automate the post-installation setup for Ubuntu and Debian systems. This script provides an interactive, menu-driven interface using `whiptail` to easily select, configure, and install various software components.

## Features

The interactive menu allows you to selectively execute the following tasks:

- **System Update:** Update and upgrade the system via `apt`.
- **APT Packages:** Install basic software defined in `apt-to-install.txt`.
- **TeX Live:** Install TeX Live packages for document production.
- **R Packages:** Install R and related packages.
- **Python Packages:** Install Python and related environments/packages.
- **Visual Studio Code:** Install the VS Code editor.
- **Git Configuration:** Set up Git username and email.
- **Docker:** Install and configure Docker.
- **Insync:** Install the Insync Google Drive client.
- **System Cleanup:** Run `apt autoremove` to clean up unused packages.

## Prerequisites

- **OS:** Debian or Ubuntu (tested on kubuntu 24.04).
- **Privileges:** You must have `sudo` privileges to run installations and system modifications.
- **Dependencies:** The script requires `whiptail`, which it will automatically attempt to install if it is not found on your system.

## Using from the cli

Simply run the following bash code:

```
curl -sL https://raw.githubusercontent.com/msperlin/ubuntu-fresh-install/main/installer.sh | bash
```