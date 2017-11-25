# https://medium.com/@henriquebastos/the-definitive-guide-to-setup-my-python-workspace-628d68552e14

brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

mkdir ~/.ve

# TODO subject of change
# set dependencies to brew installation

# latest python 11/2017
pyenv install 3.6.3
pyenv install 2.7.14

pyenv virtualenv 3.6.3 jupyter3
pyenv virtualenv 2.7.14 ipython2

# current initialization does not affect shell scripts
eval "$(pyenv init -)"

pyenv activate jupyter3
pip install jupyter
python -m ipykernel install --user
pyenv deactivate

pyenv activate ipython2
pip install ipykernel
python -m ipykernel install --user
pyenv deactivate

pyenv global 3.6.3 2.7.14 jupyter3 ipython2
