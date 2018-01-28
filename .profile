export MININETIP=192.168.0.15
alias async='rsync -e ssh -avPW ~/github/CSC458/cs144_lab5/ mininet@$MININETIP:/home/mininet/cs144_lab5'
alias bsync='rsync -e ssh -avPW mininet@$MININETIP:/home/mininet/cs144_lab5/ ~/github/CSC458/cs144_lab5'

# profile
# making quartus work on osx
export PATH=/usr/local/opt/ccache/libexec:/Users/markwang/github/GenomeKit/genome_kit:$HOME/anaconda/bin/:/Users/markwang/github/htsget/lib/samtools-1.5/bin/bin:/usr/local/Cellar/ruby/2.4.0/bin:/usr/local/mysql/bin:$HOME/.scripts:$PATH
export LC_ALL=en_US.UTF-8     # not existent on OSX, required for quartus
export LANG=en_US.UTF-8       # not existent on OSX, required for quartus
export DISPLAY=:0.0           # allow for X11fowarding using XQuartz

# compiler env
# export CC=/usr/bin/gcc
# export CXX=/usr/bin/g++

# nvm init
export NVM_DIR="/Users/markwang/.nvm"   # include npm path
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# remote ssh
export SERVERIP=159.203.47.10   # other variables
export CDF=teach.cs.utoronto.ca
export CDFHOME=/h/u13/c6/00/wangpeiq/csc258
export HPF=hpf.ccm.sickkids.ca
export HPFWD=/hpf/projects/brudno/wangpeiq
export PAGE=page.ccm.sickkids.ca
export wd=/home/wangpeiq

alias sshserver='ssh markwang@$SERVERIP'
alias cdf='ssh -Y wangpeiq@$CDF'
alias cdfsql='ssh wangpeiq@dbsrv1.teach.cs.toronto.edu'
alias hpf='ssh wangpeiq@$HPF'
alias page='ssh wangpeiq@$PAGE'

# editor
# nvim: accomodating both mac and cdf
alias vim="nvim"

OS_NAME=`uname -s`
if [ OS_NAME = "Darwin" ]; then 
    export VISUAL=/usr/local/bin/nvim
    export EDITOR=/usr/local/bin/nvim
elif [ OS_NAME = "Linux" ]; then 
    export VISUAL="$HOME/neovim/bin/nvim"
    export EDITOR="$HOME/neovim/bin/nvim"
fi

# hpf specific settings
if [ `command -v module` ]; 
then 

    export WD="/hpf/projects/brudno/wangpeiq"

    alias wd="cd $WD"
    alias sj="qstat -u wangpeiq"

    export VISUAL="/usr/bin/vim"
    export EDITOR="/usr/bin/vim"

    module load tmux
    module load tree
fi

# quick cd's
alias la='ls -a'
alias ll='ls -la'
alias cdd='cd ..'
alias cddd='cd ...'

export GITHUB_DIR='/Users/markwang/github'
export STASH="/Users/markwang/School/c_2017_2018"
alias github='cd $GITHUB_DIR'
alias stash='cd $STASH'


# utilities
alias mysql='mysql -u public'
alias python='python2'
alias duck='du -sh * | gsort -hr'
alias stat='stat -x'
alias rmswp='find ./ -maxdepth 1 -type f -name "\.*sw[klmnop]" -delete'
alias slg='cat /var/log/system.log | grep enrol | tail'
alias gitc="eval $(ssh-agent -s)  ssh-add ~/.ssh/github_rsa"        # for git pull on cdf
alias mb="cmake -H. -Bcmake-build-debug -Wno-dev"
alias mm="cmake --build cmake-build-debug -- -j5"
alias gh="python setup.py develop"


# csc494
export genomekit_storage='/Users/markwang/Library/Application Support/genome_kit/'



# tmux
export DISABLE_AUTO_TITLE=true      #  for persistent tmux window names 
alias t='tmux a -t base || tmux new -s base'        # default base tmux session
alias open='reattach-to-user-namespace open'        # enable open service in tmux sessions/windows


# syncing
alias sv='rsync -e ssh -avPW $STASH/CSC258/lab wangpeiq@teach.cs.utoronto.ca:$CDFHOME/'
alias ccms='rsync -e ssh -avPW /Users/markwang/github/mugqic_pipelines wangpeiq@hpf.ccm.sickkids.ca:/home/wangpeiq/'
alias c_sick='rsync -e ssh -avPW ~/github/sickkids/ markwang@$SERVERIP:/home/markwang/'
alias sqlsync='rsync -e ssh -avPW wangpeiq@dbsrv1.teach.cs.toronto.edu:/h/u13/c6/00/wangpeiq/csc343db/a3/ /Users/markwang/School/c_2017_2018/CSC343/assigments/a3/fromcdf'

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

    src="/Users/markwang/School/c_2017_2018"
    dest="/Users/markwang/github/Courses"

    for f in "CSC324" "CSC343" "STA302" "CSC458" "CSC321" "EAS274" "MAT247" "STA414" "CSC488" "CSC473"; do 
        mkdir $src/$f
        rsync -av $src/$f $dest
    done

}


cat ~/.doge


