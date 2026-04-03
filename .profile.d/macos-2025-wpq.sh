# macos-2025-wpq (MacBook Air M4 15', purchased 2025)
eval "$(/opt/homebrew/bin/brew shellenv)"

export OPENAI_API_KEY=$(cat ~/.openai_api_key)
export ANTHROPIC_API_KEY=$(cat ~/.anthropic_api_key)
export GOOGLE_API_KEY=$(cat ~/.google_api_key)
export PYPI_API_KEY=$(cat ~/.pypi_api_key)

alias wm='worktree-mux'

kalshi-use() {
  if [[ -z "$1" || "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: kalshi-use <profile>"
    echo ""
    echo "Sets KALSHI_ACCESS_KEY, KALSHI_PRIVATE_KEY_PATH, KALSHI_BASE_URL"
    echo "for the given profile under ~/.kalshi/<profile>/."
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
  local base="$HOME/.kalshi/$profile"
  if [[ ! -d "$base" ]]; then
    echo "Unknown profile: $profile"
    echo "Available profiles:"
    ls ~/.kalshi/
    return 1
  fi
  local env="${profile%%-*}"
  export KALSHI_ACCESS_KEY=$(cat "$base/access_key")
  export KALSHI_PRIVATE_KEY_PATH="$base/private_key.pem"
  if [[ "$env" == "demo" ]]; then
    export KALSHI_BASE_URL="https://demo-api.kalshi.co/trade-api/v2"
  else
    export KALSHI_BASE_URL="https://api.elections.kalshi.com/trade-api/v2"
  fi
  echo "kalshi: $profile ($KALSHI_BASE_URL)"
}

init_conda "/Users/wpq/softwares/miniconda3" "zsh"
