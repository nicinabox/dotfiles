# Fix /usr/local permissions
sudo chown `whoami` /usr/local

# Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap homebrew/dupes
brew tap homebrew/services

# Libs and dependencies
brew install caskroom/cask/brew-cask
brew install gpg2
brew install graphicsmagick
brew install imagemagick
brew install nano
brew install tmux
brew install tree
brew install z
brew install zsh-syntax-highlighting
brew install heroku-toolbelt
brew install reattach-to-user-namespace
brew install watchman
brew install postgresql
brew install redis
brew install node

# Services
brew services start postgresql
brew services start redis

# rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\\curl -sSL https://get.rvm.io | bash -s stable

# Applications
brew cask google-chrome
brew cask jumpcut
brew cask spotify
brew cask slack
brew cask alfred
brew cask the-unarchiver

npm install -g pure-prompt
