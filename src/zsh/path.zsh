# PATH configuration

# Local bins first
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Yarn global bin (if yarn exists)
if command -v yarn &> /dev/null; then
  export PATH="$PATH:$(yarn global bin)"
fi

# pnpm
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi
if [[ -n "$PNPM_HOME" ]]; then
  case ":$PATH:" in
    *":$PNPM_HOME:") ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

# macOS-specific: Homebrew PostgreSQL
if [[ "$OSTYPE" == "darwin"* && -d "/opt/homebrew/opt/postgresql@17/bin" ]]; then
  export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
fi

# macOS-specific: Homebrew setup
if [[ "$OSTYPE" == "darwin"* ]]; then
  export BREW=$(brew --prefix 2>/dev/null)
fi
