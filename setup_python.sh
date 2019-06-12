# https://medium.com/@henriquebastos/the-definitive-guide-to-setup-my-python-workspace-628d68552e14

brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper

# on macOS
# https://github.com/jiansoung/issues-list/issues/13
brew install zlib
brew install sqlite
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/sqlite/lib/pkgconfig"

mkdir ~/.ve

# TODO subject of change
# set dependencies to brew installation

# otherwise cannot install ycm for vim
export PYTHON_CONFIGURE_OPTS="--enable-shared"
# latest python 05/2019
pyenv install 3.7.3
pyenv install 2.7.16

pyenv virtualenv --system-site-packages 3.7.3 jupyter3
pyenv virtualenv --system-site-packages 2.7.16 ipython2
pyenv virtualenv --system-site-packages 3.7.3 flake8

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

pyenv activate flake8
pip install flake8
pyenv deactivate

pyenv global 3.7.3 2.7.16 jupyter3 ipython2

# to install additional kernel from virtualenv in jupyter
pip install ipykernel
ipython kernel install --name NAME --user
