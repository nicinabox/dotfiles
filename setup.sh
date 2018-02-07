#!/bin/bash

# Fix /usr/local permissions
sudo chown `whoami` /usr/local

# Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Taps
brew tap homebrew/dupes
brew tap homebrew/services

# Libs and dependencies
brew install \
  caskroom/cask/brew-cask \
  zsh \
  z \
  gpg2 \
  graphicsmagick \
  imagemagick \
  nano \
  git \
  tree \
  htop \
  gifify \
  ssh-copy-id \
  colordiff \
  tmux \
  httpie \
  zsh-syntax-highlighting \
  reattach-to-user-namespace \
  heroku-toolbelt \
  watchman \
  postgresql \
  redis \
  node

# Services
brew services start postgresql
brew services start redis

# rvm
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\\curl -sSL https://get.rvm.io | bash -s stable

# Applications
brew cask install \
  google-chrome \
  spotify \
  slack \
  alfred \
  atom \
  the-unarchiver \
  qlcolorcode \
  qlstephen \
  qlmarkdown \
  quicklook-json \
  qlprettypatch \
  quicklook-csv \
  betterzipql \
  qlimagesize \
  provisionql

npm install -g pure-prompt

# Install dotfiles
ruby ./install.rb

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symlinks
mv ~/.oh-my-zsh/themes/pure.zsh-theme ~/.oh-my-zsh/themes/pure.zsh-theme.bak
ln -s /usr/local/lib/node_modules/pure-prompt/pure.zsh ~/.oh-my-zsh/custom/pure.zsh-theme
ln -s /usr/local/lib/node_modules/pure-prompt/async.zsh ~/.oh-my-zsh/custom/async.zsh
