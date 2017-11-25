# !/bin/bash


# setup vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py
