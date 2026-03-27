#!/bin/bash
curl -fsSL https://pyenv.run | bash

# set pyenv into bash shell
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc

# set pyenv virtualenv autocomplete for bash
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc