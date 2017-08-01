

## My dotfiles


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



1. install vundle
    ```sh 
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
    ```
    + `PluginInstall`

2. install tpm
    ```sh 
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
    + `prefix+I`


