## My Dotfiles



#### setup mac


+ [iterm2](https://www.iterm2.com/)
    + update key shortcut for macos [here](https://stackoverflow.com/questions/6205157/iterm-2-how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line)
    + color preset to solarized light
+ system preference > keyboards > modifier keys
+ Zotero 
    + [Better BibTex](https://retorque.re/zotero-better-bibtex/installation/index.html)
    + [ZotMoov](https://github.com/wileyyugioh/zotmoov)
        + replace Zotfile, as it's not compatible with Zotero 7



#### command line


[brew](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


[zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
```sh
# note there is some config to .zshrc after installing zsh-completions
brew install zsh zsh-completions
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```


[vundle](https://github.com/VundleVim/Vundle.vim.git)
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
# then `:PluginInstall`
```

+ tmux and [tpm](https://github.com/tmux-plugins/tpm)
```sh
brew install tmux reattach-to-user-namespace
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# activate using `prefix+I`
```




#### Automatic updates

+ _updates dotfile every Monday morning at 4:01AM_
    + `crontab ./updatetab`

+ _syncing remote every Monday morning at 4:05AM_ 
    + `crontab ./installtab`

```
# ./updatetab
# min hr day(mth) mth day(wk) cmd
1 4 * * 1 cd ~/.dotfiles && ./dot update

# ./installtab
# min hr day(mth) mth day(wk) cmd
5 4 * * 1 cd ~/.dotfiles && ./dot install
```

#### MacOS specifics 


```
# .gitconfig for MacOS
[credential]
	helper = store
	helper =
	helper = /usr/local/share/gcm-core/git-credential-manager-core
[credential "https://dev.azure.com"]
	useHttpPath = true
```
