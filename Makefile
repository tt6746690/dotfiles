.PHONY: all mac linux brew zsh vim tmux dotfiles help

help: ## show available targets
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  %-15s %s\n", $$1, $$2}'

all: dotfiles ## alias for dotfiles

mac: brew zsh vim tmux dotfiles ## full macOS setup

linux: zsh-linux vim-linux tmux-linux dotfiles ## full Linux setup

brew: ## install Homebrew (macOS)
	@command -v brew >/dev/null && echo "brew already installed" || \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

zsh: ## install zsh + oh-my-zsh + plugins (macOS)
	@command -v zsh >/dev/null && echo "zsh already installed" || brew install zsh zsh-completions
	@[ -d $$HOME/.oh-my-zsh ] && echo "oh-my-zsh already installed" || \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	@[ -d $${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && echo "zsh-autosuggestions already installed" || \
		git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

zsh-linux: ## install zsh + oh-my-zsh + plugins (Linux)
	@command -v zsh >/dev/null && echo "zsh already installed" || sudo yum install -y zsh
	@[ -d $$HOME/.oh-my-zsh ] && echo "oh-my-zsh already installed" || \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	@[ -d $${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] && echo "zsh-autosuggestions already installed" || \
		git clone https://github.com/zsh-users/zsh-autosuggestions $${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

vim: ## install vim + Vundle + plugins (macOS)
	@command -v vim >/dev/null && echo "vim already installed" || brew install vim
	@[ -d $$HOME/.vim/bundle/Vundle.vim ] && echo "Vundle already installed" || \
		git clone https://github.com/VundleVim/Vundle.vim.git $$HOME/.vim/bundle/Vundle.vim
	@yes | vim +PluginInstall +qall 2>/dev/null

vim-linux: ## install vim + Vundle + plugins (Linux)
	@command -v vim >/dev/null && echo "vim already installed" || sudo yum install -y vim
	@[ -d $$HOME/.vim/bundle/Vundle.vim ] && echo "Vundle already installed" || \
		git clone https://github.com/VundleVim/Vundle.vim.git $$HOME/.vim/bundle/Vundle.vim
	@yes | vim +PluginInstall +qall 2>/dev/null

tmux: ## install tmux + tpm (macOS)
	@command -v tmux >/dev/null && echo "tmux already installed" || brew install tmux reattach-to-user-namespace
	@[ -d $$HOME/.tmux/plugins/tpm ] && echo "tpm already installed" || \
		git clone https://github.com/tmux-plugins/tpm $$HOME/.tmux/plugins/tpm

tmux-linux: ## install tmux + tpm (Linux)
	@command -v tmux >/dev/null && echo "tmux already installed" || sudo yum install -y tmux
	@[ -d $$HOME/.tmux/plugins/tpm ] && echo "tpm already installed" || \
		git clone https://github.com/tmux-plugins/tpm $$HOME/.tmux/plugins/tpm

dotfiles: ## install dotfiles to ~
	@./dot install
