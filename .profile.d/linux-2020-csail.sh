# CSAIL spice-rack GPU machines
export PATH="/data/vision/polina/shared_software:$PATH"
export PATH="/data/vision/polina/shared_software/miniconda3/bin:$PATH"
export PATH="/data/vision/polina/scratch/wpq/medical_vision/external/ANTs/bin/antsBuild/ANTS-build/Examples:$PATH"
export PATH="/data/vision/polina/shared_software/julia-1.4.0/bin:$PATH"

alias home='cd /data/vision/polina/scratch/wpq'
alias fetal='cd /data/vision/polina/projects/fetal'
alias github='cd /data/vision/polina/scratch/wpq/github'

export HF_HOME='/data/vision/polina/scratch/wpq/huggingface_cache/'

init_conda "/data/vision/polina/shared_software/miniconda3" "zsh"
