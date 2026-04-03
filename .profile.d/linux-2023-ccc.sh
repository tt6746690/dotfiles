# IBM CCC cluster (hostname: ccc*)
export HF_HOME='/dccstor/data-pruning/wpq/hf_cache'
export OPENAI_API_KEY=$(cat ~/.openai_api_key)
export JB_INFO_DONE_MIN='1'

init_conda "/dccstor/data-pruning/miniconda3" "bash"
