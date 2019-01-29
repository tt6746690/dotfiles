




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

0. [iterm2](https://www.iterm2.com/)
    + update key shortcut for macos [here](https://stackoverflow.com/questions/6205157/iterm-2-how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line)
    + color preset to solarized light

1. brew
    ```sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```


2. [zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) and [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
    ```sh
    brew install zsh zsh-completions 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    ```


3. vundle
    ```sh
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
    ```
    + `PluginInstall`

4. tmux and tpm
    ```sh
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
    + `prefix+I`


