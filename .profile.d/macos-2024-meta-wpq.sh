# macos-2024-wpq (Meta MacBook)
export OPENAI_API_KEY=$(cat ~/.openai_api_key)
export ANTHROPIC_API_KEY=$(cat ~/.anthropic_api_key)
export GOOGLE_API_KEY=$(cat ~/.google_api_key)

init_conda "$HOME/miniconda3" "zsh"
