# Tool-specific configurations

# Lazy load rbenv - only initializes when ruby/rbenv is first used
if command -v rbenv &> /dev/null; then
  rbenv() {
    unset -f rbenv
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi

# macOS-specific: Ruby with Homebrew OpenSSL
if [[ "$OSTYPE" == "darwin"* && -n "$BREW" ]]; then
  export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)/"
fi

# asdf completions
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
