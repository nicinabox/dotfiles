# Fix /usr/local permissions
chown `whoami` /usr/local

# Install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install node
brew tap homebrew/dupes
brew tap homebrew/services

brew install caskroom/cask/brew-cask
brew install gpg2
brew install graphicsmagick
brew install imagemagick
brew install nano
brew install tmux
brew install tree
brew install z
brew install heroku-toolbelt
brew install reattach-to-user-namespace
brew install watchman
brew install postgresql
brew install redis
brew install node

echo "Don't forget to finish installers for postgres and redis."

brew cask google-chrome
brew cask jumpcut

