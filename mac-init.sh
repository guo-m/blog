#!/bin/sh
# 2019.03.21

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash-completion
brew install wget imagemagick
brew install git
brew install privoxy
brew install mysql@5.7
brew cask install typora
