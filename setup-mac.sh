#!/bin/bash
# macOS setup script. Installs:
#   - Homebrew
#   - zsh + oh-my-zsh + zsh-autosuggestions
#   - vim + Vundle + plugins
#   - tmux + tpm (tmux plugin manager) + reattach-to-user-namespace
#   - dotfiles (via ./dot install)
# Idempotent: skips anything already installed.
set -euo pipefail

echo "=== macOS setup ==="

# Homebrew
if command -v brew >/dev/null; then
    echo "[ok] brew"
else
    echo "[install] brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# zsh + completions
if command -v zsh >/dev/null; then
    echo "[ok] zsh"
else
    echo "[install] zsh"
    brew install zsh zsh-completions
fi

# oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "[ok] oh-my-zsh"
else
    echo "[install] oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# zsh-autosuggestions
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "[ok] zsh-autosuggestions"
else
    echo "[install] zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# vim + Vundle
if command -v vim >/dev/null; then
    echo "[ok] vim"
else
    echo "[install] vim"
    brew install vim
fi

if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "[ok] Vundle"
else
    echo "[install] Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi
echo "[run] vim +PluginInstall"
yes | vim +PluginInstall +qall 2>/dev/null

# tmux + tpm
if command -v tmux >/dev/null; then
    echo "[ok] tmux"
else
    echo "[install] tmux"
    brew install tmux reattach-to-user-namespace
fi

if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "[ok] tpm"
else
    echo "[install] tpm"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# dotfiles
echo "[run] install dotfiles"
"$(dirname "$0")/dot" install

echo "=== done ==="
