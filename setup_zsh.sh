#!/bin/sh

# install zsh through apt-get needs more steps for autocompletion for brew
brew install zsh

# change default shell
sudo usermod -s $(which zsh) kilian
# chsh -s $(which zsh)

# zsh checks in /etc/shells which shells are installed
command -v zsh | sudo tee -a /etc/shells
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
