# macos-2015-markwang (MacBook received 2015)
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="/Applications/MATLAB_R2019a.app/bin:$PATH"
export PATH="/usr/local/opt/ccache/libexec:$PATH"
export PATH="$HOME/github/GenomeKit/genome_kit:$PATH"
export PATH="/usr/local/Cellar/ruby/2.4.0/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

alias rsync='/usr/local/Cellar/rsync/3.1.3_1/bin/rsync'

init_conda "$HOME/miniconda3" "bash"
