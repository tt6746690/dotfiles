# RPI AiMOS cluster (hostname: npl*, blp*.ccni.rpi.edu, dcs*.ccni.rpi.edu)
alias github='cd /gpfs/u/scratch/PTFM/PTFMqngp/github'

export http_proxy=http://proxy:8888
export https_proxy=$http_proxy
export HF_HOME='/gpfs/u/scratch/PTFM/PTFMqngp/huggingface_cache'
export OPENAI_API_KEY=$(cat ~/.openai_api_key)

if [[ $(uname -m) == "ppc64le" ]]; then
    init_conda "/gpfs/u/scratch/PTFM/PTFMqngp/miniconda3" "bash"
    export LD_LIBRARY_PATH=/gpfs/u/scratch/PTFM/PTFMqngp/tools/cudnn-11.3-linux-ppc64le-v8.2.1.32/targets/ppc64le-linux/lib:$LD_LIBRARY_PATH
    . "$HOME/.cargo/env"
fi

if [[ $(uname -m) == "x86_64" ]]; then
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/gpfs/u/scratch/PTFM/PTFMqngp/tools/cuda-11.2/lib64
    export PATH=$PATH:/gpfs/u/scratch/PTFM/PTFMqngp/tools/cuda-11.2/bin
    init_conda "/gpfs/u/scratch/PTFM/PTFMqngp/minoconda3_x86" "bash"
fi
