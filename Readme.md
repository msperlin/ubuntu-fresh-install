# Ubuntu Fresh Install Setup

A Bash utility designed to automate the post-installation setup for Ubuntu and Debian GNOME systems. This script provides an interactive, menu-driven interface using `whiptail` to easily select, configure, and install various software components.

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

*(Note: The codebase also contains hidden triggers for configuring non-free repositories and installing NVIDIA drivers if modified).*

## Prerequisites

- **OS:** Debian or Ubuntu (GNOME desktop environment recommended).
- **Privileges:** You must have `sudo` privileges to run installations and system modifications.
- **Dependencies:** The script requires `whiptail`, which it will automatically attempt to install if it is not found on your system.

## Usage

1. **Clone the repository:**
   ```bash
   git clone <your-repository-url>
   cd ubuntu-fresh-install
   ```

2. **Review configurations:**
   Add any required `apt` packages you want to bulk-install to `apt-to-install.txt`.

3. **Run the setup script:**
   Execute the main script. It will automatically ensure permissions are set for sub-scripts in the `scripts/` directory.
   ```bash
   ./setup-with-whiptail.sh
   ```

4. **Follow the on-screen prompts:**
   Use the `Space` bar to select/deselect components and `Enter` to confirm your choices.

5. **Restart:** 
   Once the script completes, restart your GNOME session to ensure all graphical changes and group modifications (like Docker) are applied.

## Using from the cli

Simply run the following bash code:

```
curl -sL https://raw.githubusercontent.com/msperlin/ubuntu-fresh-install/main/installer.sh | bash
```