#!/bin/bash
#
#SBATCH --job-name=install_dotfiles
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1GB

set -e # fail fully on first line failure

echo "$(hostname)"

if [ -z "$SLURM_ARRAY_TASK_ID" ]
then
    # Not in Slurm Job Array - running in single mode
    JOB_ID=$SLURM_JOB_ID
else
    # In array
    JOB_ID="${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID}"
fi


cd ~
# Install softwares
if [ ! -d ~/.oh-my-zsh ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
fi
if [ ! -d ~/.tmux/plugins/tpm ] ; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
fi

echo ./dot install
cd /data/vision/polina/scratch/wpq/github/dotfiles
./dot install



# If following error happens, will not reach here.
cd install_dotfiles
# rm "slurm-${JOB_ID}.out"
