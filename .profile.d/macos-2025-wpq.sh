# macos-2025-wpq (MacBook Air M4 15', purchased 2025)
eval "$(/opt/homebrew/bin/brew shellenv)"

export OPENAI_API_KEY=$(cat ~/.openai_api_key)
export ANTHROPIC_API_KEY=$(cat ~/.anthropic_api_key)
export GOOGLE_API_KEY=$(cat ~/.google_api_key)
export PYPI_API_KEY=$(cat ~/.pypi_api_key)

alias wm='worktree-mux'

init_conda "/Users/wpq/softwares/miniconda3" "zsh"
