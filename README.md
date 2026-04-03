## Dotfiles

### Quick start

```sh
git clone <repo> ~/.dotfiles && cd ~/.dotfiles

# macOS
./setup-mac.sh

# Linux (yum-based)
./setup-linux.sh

# deploy dotfiles
./dot install
```

### Structure

```
.profile          # dispatcher: sources helpers + machine-specific config
.profile.d/       # per-machine configs (macos-*, linux-*) + shared helpers (_common.sh, _conda.sh)
.profile_fn       # shell utility functions
dot               # dotfile sync script (update: home->repo, install: repo->home)
setup-mac.sh      # install tools (brew, zsh, vim, tmux)
setup-linux.sh    # install tools (zsh, vim, tmux)
```

### Syncing dotfiles

```sh
./dot update    # copy dotfiles from ~ into repo, commit, push
./dot install   # pull repo, copy dotfiles into ~ (creates .bak backups)
```

Clean up backup files after verifying install:
```sh
rm -f ~/.{bashrc,condarc,gitconfig,profile,profile_fn,tmux.conf,vimrc,zshrc}.bak ~/.config/nvim/init.vim.bak
```

### macOS setup notes

- [iTerm2](https://www.iterm2.com/) with solarized light color preset
- System Preferences > Keyboards > Modifier Keys
- [Zotero](https://www.zotero.org/) with [Better BibTeX](https://retorque.re/zotero-better-bibtex/installation/index.html) and [ZotMoov](https://github.com/wileyyugioh/zotmoov)
