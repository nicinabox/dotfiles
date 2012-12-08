# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 textmate ruby brew github git-flow heroku pow osx rvm ssh-agent bundler cake cloudapp)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# recommended by brew doctor
export PATH='/usr/local/bin:/Users/nic/.rvm/gems/ruby-1.9.3-p0/bin:/Users/nic/.rvm/gems/ruby-1.9.3-p0@global/bin:/Users/nic/.rvm/rubies/ruby-1.9.3-p0/bin:/Users/nic/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin'

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

 . `brew --prefix`/etc/profile.d/z.sh
 function precmd () {
   z --add "$(pwd -P)"
 }

eval "$(hub alias -s)"

# RVM
[[ -s '/Users/nic/.rvm/scripts/rvm' ]] && source '/Users/nic/.rvm/scripts/rvm'

# NVM
. ~/nvm/nvm.sh