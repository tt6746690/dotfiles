# environment variables
export PATH=/usr/local/Cellar/ruby/2.4.0/bin:/usr/local/mysql/bin:$HOME/.scripts:$PATH
export LC_ALL=en_US.UTF-8     # not existent on OSX, required for quartus
export LANG=en_US.UTF-8       # not existent on OSX, required for quartus
export DISPLAY=:0.0           # allow for X11fowarding using XQuartz
export STASH="/Users/markwang/School/2016-2017 courses"
export USBPATH='/storage/self/primary/files/'   # add android file path
export CDF_GIT='https://markus.teach.cs.toronto.edu/git/csc207-2016-09/wangpeiq'
export NVM_DIR="/Users/markwang/.nvm"   # include npm path
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export SERVERIP=159.203.47.10   # other variables
export CDFWD=/h/u13/c6/00/wangpeiq/csc258
export MUGQIC_PIPELINES_HOME=/Users/markwang/github/mugqic_pipelines
export MUGQIC_INSTALL_HOME=$HOME/github/mugqic_resources
export CCM=hpf.ccm.sickkids.ca
export HPFWD=/hpf/projects/brudno/wangpeiq
export DISABLE_AUTO_TITLE=true      #  for persistent tmux window names 

export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

#
# Aliases
# 

alias la='ls -a'
alias ll='ls -la'

# quick cd 
alias github='cd /Users/markwang/github'
alias stash='cd /Users/markwang/School/c_2016_2017'

# editor
alias vim='nvim'

# ssh host 
alias sshserver='ssh markwang@$SERVERIP'
alias cdf='ssh -Y wangpeiq@teach.cs.utoronto.ca'
alias hpf='ssh wangpeiq@hpf.ccm.sickkids.ca'

# softwares 
alias mysql='mysql -u public'
alias python='python2'

# utilities
alias duck='du -sh * | gsort -hr'
alias stat='stat -x'
alias rmswp='find ./ -maxdepth 1 -type f -name "\.*sw[klmnop]" -delete'
alias gitc="eval $(ssh-agent -s)  ssh-add ~/.ssh/github_rsa"        # for git pull on cdf
alias t='tmux a -t base || tmux new -s base'        # default base tmux session
alias open='reattach-to-user-namespace open'        # enable open service in tmux sessions/windows

# syncing
alias sv='rsync -e ssh -avPW $STASH/CSC258/lab wangpeiq@teach.cs.utoronto.ca:$CDFWD/'
alias ccms='rsync -e ssh -avPW /Users/markwang/github/mugqic_pipelines wangpeiq@hpf.ccm.sickkids.ca:/home/wangpeiq/'

# kwm
alias kwml='kwmc config reload && khd -e "reload"'
alias kwms='brew services restart kwm && brew services restart khd && brew services list'


# brew info modules for more info; need to source to use modules
source /usr/local/opt/modules/Modules/init/zsh


function sync(){
    src="/Users/markwang/School/c_2016_2017"
    dest="/Users/markwang/github/Courses"
    
    for f in "STA247" "STA261" "CSC207" "CSC209" "CSC236" "CSC263" "CSC258" "MAT237" "CSC369" "CSC373"; do
        mkdir $src/$f
        rsync -av $src/$f $dest
    done
}
