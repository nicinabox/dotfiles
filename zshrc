# Path to your oh-my-zsh installation.
export ZSH=/Users/haynesn/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Exports
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export EDITOR="sub"

# Sources
source $ZSH/oh-my-zsh.sh
source `brew --prefix`/etc/profile.d/z.sh

# The next line updates PATH for the Google Cloud SDK.
source '/Users/haynesn/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/haynesn/google-cloud-sdk/completion.zsh.inc'

source $HOME/.aliases
