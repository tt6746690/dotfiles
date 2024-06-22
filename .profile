
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
    alias stash='cd $HOME/Dropbox\ \(MIT\)/School/2021.2022'
    alias duck='du -sh * | gsort -hr'
    alias stat='stat -x'
    alias tkt='kinit wpq@CSAIL.MIT.EDU'
    alias github='cd $HOME/github'

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

        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/Users/markwang/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/markwang/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/markwang/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/Users/markwang/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
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

    # 
    # mit-ibm 2023
    # 
    if [ `id -un` = "peiqiw" ]; then
        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/Users/peiqiw/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/Users/peiqiw/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/Users/peiqiw/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/Users/peiqiw/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<
    fi
fi


#
# Sandy's machine
# 
if [[ $(cat /etc/machine-id) == "c030daf99d5e4a739d8337011982d137" ]]; then
    alias github='cd $HOME/github'

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/wpq/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/wpq/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/wpq/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/wpq/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi

#
# meta submit
#
set_env_for_meta_machines() {
    alias github='cd /fsx/wpq/github'
    export MODULEPATH=/opt/slurm/etc/files/modulesfiles/:$MODULEPATH
    export HF_HOME=/fsx/wpq/.cache/huggingface
    export WANDB_DIR=/fsx/wpq/github/metasummer2024/cache
    export WANDB_PROJECT=meta
    export OPENAI_API_KEY=$(cat /data/home/wpq/.openai_api_key)

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/fsx/wpq/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/fsx/wpq/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/fsx/wpq/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/fsx/wpq/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    function speek {
        run_id=$1
        log_file="/fsx/wpq/.slurm_log/$run_id.out"
        if [ -f "$log_file" ]; then
            cat "$log_file"
        else
            echo "$run_id finished"
        fi
    }
}


# assume using only zsh for everything. nothing is set if using bash.
if [[ "$0" == *zsh ]]; then
    if [[ $(hostname) == submit-0 || $(hostname) =~ '^a100-st2-p4de24xlarge-([0-9]|[1-9][0-9])$' ]] && [[ $(uname) == Linux ]]; then
        set_env_for_meta_machines
    fi
fi


#
# ibm ccc server
# 
if [[ $(hostname) == ccc* ]] && [[ $(uname) == Linux ]]; then

    export HF_HOME='/dccstor/data-pruning/wpq/hf_cache'
    export OPENAI_API_KEY=$(cat ~/.openai_api_key)
    export JB_INFO_DONE_MIN='1'

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/dccstor/data-pruning/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/dccstor/data-pruning/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/dccstor/data-pruning/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/dccstor/data-pruning/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

fi

#
# satori
#
if [[ "$(hostname)" == satori* || "$(hostname -f)" =~ node[0-9]{4}\.inband$ ]] && [[ $(uname) == Linux  ]]; then

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/software.ppc64le/spack/v0.16.2/spack/opt/spack/linux-rhel8-power9le/gcc-8.3.1/anaconda3-2020.02-2ks5tchtak3kzzbryjloiqhusujnh67c/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/software.ppc64le/spack/v0.16.2/spack/opt/spack/linux-rhel8-power9le/gcc-8.3.1/anaconda3-2020.02-2ks5tchtak3kzzbryjloiqhusujnh67c/etc/profile.d/conda.sh" ]; then
            . "/home/software.ppc64le/spack/v0.16.2/spack/opt/spack/linux-rhel8-power9le/gcc-8.3.1/anaconda3-2020.02-2ks5tchtak3kzzbryjloiqhusujnh67c/etc/profile.d/conda.sh"
        else
            export PATH="/home/software.ppc64le/spack/v0.16.2/spack/opt/spack/linux-rhel8-power9le/gcc-8.3.1/anaconda3-2020.02-2ks5tchtak3kzzbryjloiqhusujnh67c/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

fi



#
# aimos
#

# List of hostname patterns to match against
aimos_hostnames=("npl*" "blp*.ccni.rpi.edu" "dcs*.ccni.rpi.edu")

# Function to check if the hostname matches any pattern
check_hostname() {
    local hostname="$1"
    for pattern in "${aimos_hostnames[@]}"; do
        if [[ "$hostname" == $pattern  ]]; then
            return 0
        fi
    done
    return 1
}


# Call the function to check the hostname
if check_hostname "$(hostname -f)"; then

    alias github='cd /gpfs/u/scratch/PTFM/PTFMqngp/github'

    # setup Proxy: https://docs.cci.rpi.edu/landingpads/Proxy/
    export http_proxy=http://proxy:8888
    export https_proxy=$http_proxy

    export HF_HOME='/gpfs/u/scratch/PTFM/PTFMqngp/huggingface_cache'
    export OPENAI_API_KEY=$(cat ~/.openai_api_key)

    # dcs
    if [[ $(uname -m) == "ppc64le" ]]; then
        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/gpfs/u/scratch/PTFM/PTFMqngp/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/gpfs/u/scratch/PTFM/PTFMqngp/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/gpfs/u/scratch/PTFM/PTFMqngp/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/gpfs/u/scratch/PTFM/PTFMqngp/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<

        # add cudnn binaries to PATH
        export LD_LIBRARY_PATH=/gpfs/u/scratch/PTFM/PTFMqngp/tools/cudnn-11.3-linux-ppc64le-v8.2.1.32/targets/ppc64le-linux/lib:$LD_LIBRARY_PATH
	
	# add rust to path
	. "$HOME/.cargo/env"
    fi

    # npl
    if [[ $(uname -m) == "x86_64" ]]; then
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.//cuda-11.2/lib64
        export PATH=$PATH:.//cuda-11.2/bin
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/gpfs/u/scratch/PTFM/PTFMqngp/tools/cuda-11.2/lib64
        export PATH=$PATH:/gpfs/u/scratch/PTFM/PTFMqngp/tools/cuda-11.2/bin

        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/gpfs/u/scratch/PTFM/PTFMqngp/minoconda3_x86/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/gpfs/u/scratch/PTFM/PTFMqngp/minoconda3_x86/etc/profile.d/conda.sh" ]; then
                . "/gpfs/u/scratch/PTFM/PTFMqngp/minoconda3_x86/etc/profile.d/conda.sh"
            else
                export PATH="/gpfs/u/scratch/PTFM/PTFMqngp/minoconda3_x86/bin:$PATH"
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
    basil.csail.mit.edu|quassia.csail.mit.edu|cumin.csail.mit.edu|sumac.csail.mit.edu|fennel.csail.mit.edu|pandan.csail.mit.edu|chili.csail.mit.edu|wasabi.csail.mit.edu|mace.csail.mit.edu|malt.csail.mit.edu|neem.csail.mit.edu|juniper.csail.mit.edu|jimbu.csail.mit.edu|cassia.csail.mit.edu|olida.csail.mit.edu|anise.csail.mit.edu|mint.csail.mit.edu|peppermint.csail.mit.edu|bergamot.csail.mit.edu|zaatar.csail.mit.edu|thyme.csail.mit.edu|marjoram.csail.mit.edu|perilla.csail.mit.edu|lemongrass.csail.mit.edu|clove.csail.mit.edu|curcum.csail.mit.edu|sassafras.csail.mit.edu|urfa-biber.csail.mit.edu|rosemary.csail.mit.edu|caraway.csail.mit.edu|sumac.csail.mit.edu|fennel.csail.mit.edu|rosemary.csail.mit.edu|urfa-biber.csail.mit.edu)

    # shared software
    export PATH="/data/vision/polina/shared_software:$PATH"
    # miniconda
    export PATH="/data/vision/polina/shared_software/miniconda3/bin:$PATH"
    # ANTs
    export PATH="/data/vision/polina/scratch/wpq/medical_vision/external/ANTs/bin/antsBuild/ANTS-build/Examples:$PATH"

    # aliases
    alias home='cd /data/vision/polina/scratch/wpq'
    alias fetal='cd /data/vision/polina/projects/fetal'
    alias github='cd /data/vision/polina/scratch/wpq/github'

    # julia
    export PATH="/data/vision/polina/shared_software/julia-1.4.0/bin:$PATH"

    # huggingface 
    export HF_HOME='/data/vision/polina/scratch/wpq/huggingface_cache/'

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
