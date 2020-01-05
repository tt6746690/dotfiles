#
# nfs specific config
case `uname -n` in
    quassia|cumin|marjoram|thyme|zaatar|bergamot|peppermint|mint|anise|olida|cassia|jimbu|juniper|neem|malt|mace|wasabi|chili|pandan|fennel|sumac)
    export PATH="/data/vision/polina/shared_software:$PATH"
    export PATH="/data/vision/polina/shared_software/miniconda3/bin:$PATH"
    export PATH="/data/vision/polina/scratch/wpq/medical_vision/external/ANTs/bin/antsBuild/ANTS-build/Examples:$PATH"
    alias home='cd /data/vision/polina/scratch/wpq'
    alias fetal='/data/vision/polina/projects/fetal'
    source /afs/csail.mit.edu/system/common/etc/environment/sh/matlab
esac

# PATH
#
# haskell installed pkgs 
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# added by Anaconda3 5.1.0 installer
export PATH="$HOME/anaconda3/bin:$PATH"
# added by Anaconda2 5.1.0 installer
export PATH="/anaconda2/bin:$PATH"

# added by Anaconda2 4.4.0 installer
export PATH="$HOME/anaconda/bin:$PATH"
# added by Miniconda3 installer
export PATH="$HOME/miniconda3/bin:$PATH"

# gcloud 
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
# matlab
export PATH="/Applications/MATLAB_R2019a.app/bin:$PATH"
# ccache
export PATH="/usr/local/opt/ccache/libexec:$PATH"
# genome_kit
export PATH="$HOME/github/GenomeKit/genome_kit:$PATH"
# samtools
export PATH="$HOME/github/htsget/lib/samtools-1.5/bin/bin:$PATH"
# ruby
export PATH="/usr/local/Cellar/ruby/2.4.0/bin:$PATH"
# mysql
export PATH="/usr/local/mysql/bin:$PATH"
# impromptu scripts
export PATH="$HOME/.scripts:$PATH"
# cargo
#
# envs
#
# nvm init
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# making quartus work on osx
export LC_ALL=en_US.UTF-8     # not existent on OSX, required for quartus
export LANG=en_US.UTF-8       # not existent on OSX, required for quartus
export DISPLAY=:0 # remember to open xquartz first 

# ssh domains
export SERVERIP=159.203.47.10
export CDF=teach.cs.utoronto.ca
export CDFHOME=/h/u13/c6/00/wangpeiq/
export HPF=hpf.ccm.sickkids.ca
export HPFWD=/hpf/projects/brudno/wangpeiq
export PAGE=page.ccm.sickkids.ca
export wd=/home/wangpeiq
export DCS=cs.toronto.edu
export ALICEDESKTOP=192.168.184.236   # on mars-tenant only
export SHRESHTHDESKTOP=192.168.184.25 # on mars-tenant only
export CPU1=cpu1.dg
export COMPS0=comps0.cs.toronto.edu
export SLURM=scheduler.cs.toronto.edu   # access GPU nodes
export SCINET=teach.scinet.utoronto.ca

# frequent directories
export GITHUB_DIR="$HOME/github"
export STASH="$HOME/School/c_2018_2019"

# ssh aliases
alias sshserver='ssh markwang@$SERVERIP'
alias cdf='ssh -Y wangpeiq@$CDF'
alias cdfsql='ssh wangpeiq@dbsrv1.teach.cs.toronto.edu'
alias hpf='ssh wangpeiq@$HPF'
alias page='ssh wangpeiq@$PAGE'
alias dcs='ssh wpq@$DCS'
alias alice='ssh mark@$ALICEDESKTOP'
alias shresh='ssh mark@$SHRESHTHDESKTOP'
alias cpu1='ssh mark.wang@$CPU1'
alias comps0='ssh wpq@$COMPS0'
alias compslurm='ssh wpq@$SLURM'
alias scinet='ssh -Y csc367student028@$SCINET'
alias zeus='ssh wpq@zeus.dgp.toronto.edu'
alias cumin='ssh -X wpq@cumin.csail.mit.edu'         # on CSAIL-Private only
alias quassia='ssh -X wpq@quassia.csail.mit.edu'  # on CSAIL-Private only

# alias for getting around
alias github='cd $GITHUB_DIR'
alias stash='cd $STASH'

# different versions of julia
if [ `uname -s` = "Darwin" ]; then 
    alias julia7="/Applications/Julia-0.7.app/Contents/Resources/julia/bin/julia"
    alias julia="/Applications/Julia-1.0.app/Contents/Resources/julia/bin/julia"
elif [ `uname -s` = "Linux" ]; then 
    alias julia7="$HOME/julia-0.7.0/bin/julia"
    alias julia="$HOME/julia-1.0.0/bin/julia"
fi

# quick cd's
alias la='ls -a'
alias ll='ls -la'
alias cdd='cd ..'
alias cddd='cd ...'

# shortcuts
alias rsyncc='/usr/local/Cellar/rsync/3.1.3_1/bin/rsync'
alias mysql='mysql -u public'
alias python='python3'
alias duck='du -sh * | gsort -hr'
alias stat='stat -x'
alias rmswp='find ./ -maxdepth 1 -type f -name "\.*sw[klmnop]" -delete'
alias gitc="eval $(ssh-agent -s)  ssh-add ~/.ssh/github_rsa"        # for git pull on cdf
alias mb="cmake -H. -Bcmake-build-debug -Wno-dev"
alias mm="cmake --build cmake-build-debug -- -j5"
alias tkt='kinit wpq@CSAIL.MIT.EDU'

# tmux
export DISABLE_AUTO_TITLE=true                      #  for persistent tmux window names 
alias t='tmux a -t base || tmux new -s base'        # default base tmux session
alias open='reattach-to-user-namespace open'        # enable open service in tmux sessions/windows

# kwm
alias kwml='kwmc config reload && khd -e "reload"'
alias kwms='brew services restart kwm && brew services restart khd && brew services list'

# editor
# nvim: accomodating both mac and cdf
alias vim="nvim"
if [ `uname -s` = "Darwin" ]; then 
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

case `uname -n` in
    cumin)
    export DISPLAY=0.0
esac


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

    src="/Users/markwang/School/c_2018_2019"
    dest="/Users/markwang/github/Courses"

    for f in "CSC419" "CSC418" "MAT327" "MAT347" "CSC320" "CSC367" "CSC446" "EE364" "APM462"; do
        mkdir $src/$f
        rsync -av $src/$f $dest 
    done

}

g_sync(){
    src="/Users/markwang/School/c_2019_2020"
    dest="/Users/markwang/github/schoolwork"
    for f in "6.438"; do
        mkdir $src/$f
        rsync -av $src/$f $dest 
    done
}

# makes a new latex template with specified filename and populate body with stdio, if exists
latem() {
    # determine filename from cml  
    if [ -z "$1" ] 
    then 
        latex_filename="template" 
    else 
        latex_filename="$1"
    fi 

    # create new latex template if not exist 
    if [ ! -f "$latex_filename.tex" ]
    then 
        {
            echo "\documentclass[11pt]{article}"
            echo "\input{\string~/.preamble}"
            echo
            echo \\\\begin{document}
            for i in {1..10}
            do 
                echo 
            done 
            echo \\\\end{document}

        } > "$latex_filename.tex"	
    fi
}
