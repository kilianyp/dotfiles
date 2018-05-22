## Dependencies 

- git 
- curl
- zsh
- gcc

### Ubuntu
sudo apt install git curl zsh build-essential file python-setuptools
sudo apt-get install $(grep -vE "^\s*#" apt-packages.txt  | tr "\n" " ")


sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Credits
https://github.com/lucasb-eyer/dotfiles
https://github.com/mathiasbynens/dotfiles
