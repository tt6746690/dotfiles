# Meta submit nodes (submit-0, a100-st2-*)
alias github='cd /fsx/wpq/github'

export MODULEPATH=/opt/slurm/etc/files/modulesfiles/:$MODULEPATH
export HF_HOME=/fsx/wpq/.cache/huggingface
export WANDB_DIR=/fsx/wpq/github/metasummer2024/cache
export WANDB_PROJECT=meta
export OPENAI_API_KEY=$(cat /data/home/wpq/.openai_api_key)
export ANTHROPIC_API_KEY=$(cat /data/home/wpq/.anthropic_api_key)

init_conda "/fsx/wpq/miniconda3" "bash"

function speek {
    if [[ "$1" == "-i" ]]; then
        index=$2
        running_jobs=($(squeue --me -h -o "%i" --sort=t,i))

        if [[ $index -lt 0 ]]; then
            total_jobs=${#running_jobs[@]}
            index=$((total_jobs + index))
        fi

        if [[ $index -ge 1 && $index -le ${#running_jobs[@]} ]]; then
            job_id=${running_jobs[$index]}
            log_file="/fsx/wpq/.slurm_log/$job_id.out"
            if [[ -f "$log_file" ]]; then
                cat "$log_file"
                echo
                echo "speek $job_id"
            else
                echo "Log file $log_file for job $job_id does not exist."
            fi
        else
            echo "Index out of range"
            return 1
        fi
    elif [[ $# -eq 1 ]]; then
        job_id=$1
        log_file="/fsx/wpq/.slurm_log/$job_id.out"
        if [[ -f "$log_file" ]]; then
            cat "$log_file"
        else
            echo "$job_id finished or log file does not exist."
        fi
    else
        echo "Usage: speek <job_id> or speek -i <index>"
        return 1
    fi
}
