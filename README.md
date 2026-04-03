## Dotfiles

### Quick start

```sh
# macOS
git clone <repo> ~/.dotfiles && cd ~/.dotfiles && make mac

# Linux (yum-based)
git clone <repo> ~/.dotfiles && cd ~/.dotfiles && make linux
```

### Individual targets

```sh
make help       # show all targets
make brew       # install Homebrew (macOS)
make zsh        # install zsh + oh-my-zsh + plugins
make vim        # install vim + Vundle + plugins
make tmux       # install tmux + tpm
make dotfiles   # symlink dotfiles to ~
```

### Structure

```
.profile          # dispatcher: sources helpers + machine-specific config
.profile.d/       # per-machine configs (macos-*, linux-*) + shared helpers (_common.sh, _conda.sh)
.profile_fn       # shell utility functions
dot               # dotfile sync script (update: home->repo, install: repo->home)
Makefile          # setup automation
```

### Syncing dotfiles

```sh
./dot update    # copy dotfiles from ~ into repo, commit, push
./dot install   # pull repo, copy dotfiles into ~
```

### macOS setup notes

- [iTerm2](https://www.iterm2.com/) with solarized light color preset
- System Preferences > Keyboards > Modifier Keys
- [Zotero](https://www.zotero.org/) with [Better BibTeX](https://retorque.re/zotero-better-bibtex/installation/index.html) and [ZotMoov](https://github.com/wileyyugioh/zotmoov)
