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

cd /data/vision/polina/scratch/wpq/github/dotfiles
./dot install

# If following error happens, will not reach here.
cd install_dotfiles
rm "slurm-${JOB_ID}.out"
