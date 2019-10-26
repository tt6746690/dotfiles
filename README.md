## My Dotfiles

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

5. system preference > keyboards > modifier keys


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


#### Tips

```
# how to do ssh X11 forwarding 
# host
export DISPLAY=:0
xhost +
# client
ssh -Y username@host
matlab -desktop
```

```
# recursively strip files ending in `.txt` of extensions
find . -name '*.txt' -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '.' | rev) ; done
# recursively rename files _gitignore -> .gitignore
find . -name _gitignore -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '/' | rev)/.gitignore; done
find . -name _gitattributes -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '/' | rev)/.gitattributes; done
find . -name _DS_Store -type f -print | while read d; do mv $d $(echo $d | rev | cut -f 2- -d '/' | rev)/.DS_Store; done
# recursively chmod
find external/RED -type f -perm 644 -print -exec chmod 755 {} \;
```
