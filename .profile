# profile
# making quartus work on osx
export PATH=/usr/local/Cellar/ruby/2.4.0/bin:/usr/local/mysql/bin:$HOME/.scripts:$PATH
export LC_ALL=en_US.UTF-8     # not existent on OSX, required for quartus
export LANG=en_US.UTF-8       # not existent on OSX, required for quartus
export DISPLAY=:0.0           # allow for X11fowarding using XQuartz

# nvm init
export NVM_DIR="/Users/markwang/.nvm"   # include npm path
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# remote ssh
export SERVERIP=159.203.47.10   # other variables
export CDF=teach.cs.utoronto.ca
export CDFHOME=/h/u13/c6/00/wangpeiq/csc258
export CCM=hpf.ccm.sickkids.ca
export HPFWD=/hpf/projects/brudno/wangpeiq

alias sshserver='ssh markwang@$SERVERIP'
alias cdf='ssh -Y wangpeiq@$CDF'
alias hpf='ssh wangpeiq@$HPF'


# editor
alias vim='nvim'
# nvim: accomodating both mac and cdf
OS_NAME=`uname -s`
if [ OS_NAME = "Darwin" ]; then 
    export VISUAL=/usr/local/bin/nvim
    export EDITOR=/usr/local/bin/nvim
elif [ OS_NAME = "Linux" ]; then 
    export VISUAL="$HOME/neovim/bin/nvim"
    export EDITOR="$HOME/neovim/bin/nvim"
fi


# quick cd's
alias la='ls -a'
alias ll='ls -la'
alias cdd='cd ..'
alias cddd='cd ...'

export GITHUB_DIR='/Users/markwang/github'
export STASH="/Users/markwang/School/c_2016_2017"
alias github='cd $GITHUB_DIR'
alias stash='cd /Users/markwang/School/c_2016_2017'


# utilities
alias mysql='mysql -u public'
alias python='python2'
alias duck='du -sh * | gsort -hr'
alias stat='stat -x'
alias rmswp='find ./ -maxdepth 1 -type f -name "\.*sw[klmnop]" -delete'
alias slg='cat /var/log/system.log | tail'
alias gitc="eval $(ssh-agent -s)  ssh-add ~/.ssh/github_rsa"        # for git pull on cdf


# tmux
export DISABLE_AUTO_TITLE=true      #  for persistent tmux window names 
alias t='tmux a -t base || tmux new -s base'        # default base tmux session
alias open='reattach-to-user-namespace open'        # enable open service in tmux sessions/windows


# syncing
alias sv='rsync -e ssh -avPW $STASH/CSC258/lab wangpeiq@teach.cs.utoronto.ca:$CDFHOME/'
alias ccms='rsync -e ssh -avPW /Users/markwang/github/mugqic_pipelines wangpeiq@hpf.ccm.sickkids.ca:/home/wangpeiq/'

# kwm
alias kwml='kwmc config reload && khd -e "reload"'
alias kwms='brew services restart kwm && brew services restart khd && brew services list'

# brew info modules for more info; need to source to use modules
# source /usr/local/opt/modules/Modules/init/zsh

c_sync(){
    src="/Users/markwang/School/c_2016_2017"
    dest="/Users/markwang/github/Courses"
    
    for f in "STA247" "STA261" "CSC207" "CSC209" "CSC236" "CSC263" "CSC258" "MAT237" "CSC369" "CSC373"; do
        mkdir $src/$f
        rsync -av $src/$f $dest
    done
}
