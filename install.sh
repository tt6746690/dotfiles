
HOME_BASE_DIR="/"
home_files="
.bashrc
.khdrc
.gitconfig
.khdrc
.preamble.tex
.profile
.tmux.conf
.zshrc
"

NVIM_BASE_CONFIG_DIR=".config/nvim"
nvim_files="
init.vim
"

KWM_BASE_CONFIG_DIR=".kwm"
kwm_files="
khdrc
kwmrc
"

VIM_BASE_CONFIG_DIR=".vim"
ycm_files="
.ycm_extra_conf.py
"

# Update: from src to . 
# Install: from . to src
function dotsync(){
    # @param 1: dirname of filepath after $HOME
    # @param 2...: list of file names
    base=$1
    shift   # skipping first arg

    echo Copy over dotfiles...
    for f in "$@"
    do
        src="$HOME/$base/$f"
        dest="./$base/$f"
        if [ -e $src ]; then
            # echo Copy $src to $dest
            echo Copy over $f
            mkdir -p `dirname $dest` && cp $src $dest
        else
            echo $src not found
        fi
    done
    echo Copy finished...
}

dotsync $HOME_BASE_DIR $home_files
dotsync $NVIM_BASE_CONFIG_DIR $nvim_files
dotsync $KWM_BASE_CONFIG_DIR $kwm_files
dotsync $VIM_BASE_CONFIG_DIR $ycm_files


# Push to repo if there are changes
git add -A

if [ -n "$(git status --porcelain)" ]; then 
  echo "there are changes"; 
  git commit -m "change on epoch $(date +'%s')"
  git push origin master
else 
  echo "no changes";
fi







