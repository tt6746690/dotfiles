# common aliases
alias github='cd $HOME/github'

# quick cd's
alias la='ls -a'
alias ll='ls -la'
alias cdd='cd ..'
alias cddd='cd ...'


# tmux
export DISABLE_AUTO_TITLE=true                      # for persistent tmux window names 
alias t='tmux a -t base || tmux new -s base'        # default base tmux session
alias open='reattach-to-user-namespace open'        # enable open service in tmux sessions/windows


# shortcuts
alias rmswp='find ./ -maxdepth 1 -type f -name "\.*sw[klmnop]" -delete'
alias python='python3'


if [ `uname -s` = "Darwin" ]; then

    # ssh aliases
    alias cdf='ssh -Y wangpeiq@teach.cs.utoronto.ca'
    alias cdfsql='ssh wangpeiq@dbsrv1.teach.cs.toronto.edu'
    alias sickkids='ssh wangpeiq@hpf.ccm.sickkids.ca'
    alias page='ssh wangpeiq@page.ccm.sickkids.ca'
    alias dcs='ssh wpq@cs.toronto.edu'
    alias alice='ssh mark@192.168.184.236'  # on mars-tenant only
    alias shresh='ssh mark@192.168.184.25'  # on mars-tenant only
    alias cpu1='ssh mark.wang@cpu1.dg'
    alias comps0='ssh wpq@comps0.cs.toronto.edu'
    alias compslurm='ssh wpq@$scheduler.cs.toronto.edu' # access GPU nodes
    alias scinet='ssh -Y csc367student028@teach.scinet.utoronto.ca'
    alias zeus='ssh wpq@zeus.dgp.toronto.edu'
    alias cumin='ssh -X wpq@cumin.csail.mit.edu'      # on MIT network only
    alias quassia='ssh -X wpq@quassia.csail.mit.edu'  # on MIT network only
    alias chili='ssh -X wpq@chili.csail.mit.edu'      # on MIT network only
    alias athena='ssh athena.dialup.mit.edu'

    # other alises
    alias stash='cd $HOME/Dropbox\ \(MIT\)/School/2020.2021'
    alias duck='du -sh * | gsort -hr'
    alias stat='stat -x'
    alias tkt='kinit wpq@CSAIL.MIT.EDU'

    #
    # 2015 MacBook
    #
    if [ `id -un` = "markwang" ]; then
        export PATH="$HOME/.local/bin:$PATH"
        # added by Miniconda3 installer
        export PATH="$HOME/miniconda3/bin:$PATH"
        # matlab
        export PATH="/Applications/MATLAB_R2019a.app/bin:$PATH"
        # ccache
        export PATH="/usr/local/opt/ccache/libexec:$PATH"
        # genome_kit
        export PATH="$HOME/github/GenomeKit/genome_kit:$PATH"
        # ruby
        export PATH="/usr/local/Cellar/ruby/2.4.0/bin:$PATH"
        # impromptu scripts
        export PATH="$HOME/.scripts:$PATH"
        # nvm init
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

        # aliases
        alias rsync='/usr/local/Cellar/rsync/3.1.3_1/bin/rsync'
    fi

    #
    # 2019 MacBook
    #
    if [ `id -un` = "wpq" ]; then
        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/Users/wpq/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/wpq/opt/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/wpq/opt/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/Users/wpq/opt/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
    fi
fi

#
# server specific settings
#
case `uname -n` in
    quassia|cumin|sumac|fennel|pandan|chili|wasabi|mace|malt|neem|juniper|jimbu|cassia|olida|anise|mint|peppermint|bergamot|zaatar|thyme|marjoram|perilla|lemongrass|clove|curcum|sassafras)

    # shared software
    export PATH="/data/vision/polina/shared_software:$PATH"
    # miniconda
    export PATH="/data/vision/polina/shared_software/miniconda3/bin:$PATH"
    # ANTs
    export PATH="/data/vision/polina/scratch/wpq/medical_vision/external/ANTs/bin/antsBuild/ANTS-build/Examples:$PATH"

    # aliases
    alias home='cd /data/vision/polina/scratch/wpq'
    alias fetal='/data/vision/polina/projects/fetal'

    # loads scripts for shared application provided by CSAIL server
    source /afs/csail.mit.edu/system/common/etc/environment/sh/matlab

    # julia
    export PATH="/data/vision/polina/shared_software/julia-1.4.0/bin:$PATH"


    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/data/vision/polina/shared_software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/data/vision/polina/shared_software/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/data/vision/polina/shared_software/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/data/vision/polina/shared_software/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
     # >>> conda initialize >>>
esac





c_sync(){
    src="$HOME/Dropbox (MIT)/School/2016.2017"
    dest="$HOME/github/Courses"

    for f in "STA247" "STA261" "CSC207" "CSC209" "CSC236" "CSC263" "CSC258" "MAT237" "CSC369" "CSC373"; do
        mkdir "$dest" ||:
        rsync -av $src/$f $dest
    done

    src="$HOME/Dropbox (MIT)/School/2017.2018"
    dest="$HOME/github/Courses"

    for f in "CSC324" "CSC343" "STA302" "CSC458" "CSC321" "EAS274" "MAT247" "STA414" "CSC488" "CSC473"; do 
        mkdir "$dest" ||:
        rsync -av $src/$f $dest
    done

    src="$HOME/Dropbox (MIT)/School/2018.2019"
    dest="$HOME/github/Courses"

    for f in "CSC419" "CSC418" "MAT327" "MAT347" "CSC320" "CSC367" "CSC446" "EE364" "APM462"; do
        mkdir "$dest" ||:
        rsync -av $src/$f $dest 
    done

}

g_sync(){
    src="$HOME/Dropbox (MIT)/School/2019.2020"
    dest="$HOME/github/schoolwork"
    for f in "6.438" "6.437" "6.881"; do
        mkdir "$dest" ||:
        rsync -av "$src/$f" "$dest"
    done
    src="$HOME/Dropbox (MIT)/School/2020.2021"
    dest="$HOME/github/schoolwork"
    for f in "6.436" "18.1002" "6.838"; do
        mkdir "$dest" ||:
        rsync -av "$src/$f" "$dest"
    done
    src="$HOME/Dropbox (MIT)/School/2021.2022"
    dest="$HOME/github/schoolwork"
    for f in "6.840" "6.864"; do
        mkdir "$dest" ||:
        rsync -av "$src/$f" "$dest"
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
