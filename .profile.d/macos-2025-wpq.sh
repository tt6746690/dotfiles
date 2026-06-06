# macos-2025-wpq (MacBook Air M4 15', purchased 2025)
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH"

export OPENAI_API_KEY=$(cat ~/.openai_api_key)
export ANTHROPIC_API_KEY=$(cat ~/.anthropic_api_key)
export GOOGLE_API_KEY=$(cat ~/.google_api_key)
export PYPI_API_KEY=$(cat ~/.pypi_api_key)

alias wm='worktree-mux'
# note: auto mode is disabled for opus 4.6
alias cld='claude --enable-auto-mode --model claude-opus-4-6'

kalshi-use() {
  # Activate a kalshi profile by sourcing its env file. Each profile is a
  # directory ~/.kalshi/<profile>/ containing a plain KEY=value `env` file
  # (KALSHI_ACCESS_KEY, KALSHI_PRIVATE_KEY_PATH, KALSHI_BASE_URL) plus the key.
  # The env file is the single source of truth, so the same file also works with
  # `uv run --env-file` and docker `env_file:` — this function just sources it.
  if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: kalshi-use <profile>"
    echo ""
    echo "Sources ~/.kalshi/<profile>/env (sets KALSHI_ACCESS_KEY,"
    echo "KALSHI_PRIVATE_KEY_PATH, KALSHI_BASE_URL)."
    echo ""
    echo "Available profiles:"
    ls ~/.kalshi/
    echo ""
    echo "Examples:"
    echo "  kalshi-use prod-readonly"
    echo "  kalshi-use demo-readwrite"
    return 0
  fi
  local profile="$1"
  local envfile="$HOME/.kalshi/$profile/env"
  if [[ ! -f "$envfile" ]]; then
    echo "No env file: $envfile"
    echo "Available profiles:"
    ls ~/.kalshi/
    return 1
  fi
  set -a            # auto-export every variable assigned while sourcing
  source "$envfile"
  set +a
  echo "kalshi: $profile ($KALSHI_BASE_URL)"
}

init_conda "/Users/wpq/softwares/miniconda3" "zsh"
