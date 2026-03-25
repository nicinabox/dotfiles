# Source external files

function safe_source() {
  [[ -f "$1" ]] && source "$1"
}

function source_env() {
  safe_source .env
}

# Add hook to source .env on directory change
autoload -U add-zsh-hook
add-zsh-hook chpwd source_env
source_env

# Aliases
source $HOME/.aliases

# Secrets (not version controlled)
safe_source "$HOME/.secrets"
safe_source "$HOME/.zshrc.local"

# macOS-specific: z.sh from Homebrew
if [[ "$OSTYPE" == "darwin"* && -n "$BREW" ]]; then
  safe_source $BREW/etc/profile.d/z.sh
  safe_source $BREW/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Prezto
safe_source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
