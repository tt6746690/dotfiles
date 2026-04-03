# init_conda: replaces the repeated conda initialize blocks
# usage: init_conda <conda_install_path> [shell_name]
init_conda() {
    local conda_path="$1"
    local shell_name="${2:-bash}"

    __conda_setup="$("${conda_path}/bin/conda" "shell.${shell_name}" 'hook' 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "${conda_path}/etc/profile.d/conda.sh" ]; then
            . "${conda_path}/etc/profile.d/conda.sh"
        else
            export PATH="${conda_path}/bin:$PATH"
        fi
    fi
    unset __conda_setup
}
