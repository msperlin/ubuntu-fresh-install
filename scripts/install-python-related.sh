#!/bin/bash
set -euo pipefail

# install pyenv
curl -fsSL https://pyenv.run | bash

# set pyenv into bash shell
if ! grep -q 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bashrc; then
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc
fi

# set pyenv virtualenv autocomplete for bash
if ! grep -q 'pyenv virtualenv-init' ~/.bashrc; then
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
fi

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
if ! grep -q 'uv generate-shell-completion' ~/.bashrc; then
    echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
fi

# install other python utils
sudo apt install -y python3-venv python3-pip python3-pytest