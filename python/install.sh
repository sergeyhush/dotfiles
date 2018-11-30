PYENV_DIR=$HOME/.pyenv
if  [ ! -d $PYENV_DIR ]; then
    git clone https://github.com/pyenv/pyenv.git $PYENV_DIR
fi
PYENV_PLUGINS_DIR=$PYENV_DIR/plugins
mkdir -p $PYENV_PLUGINS_DIR
if [ ! -d $PYENV_PLUGINS_DIR/pyenv-virtualenvwrapper ]; then
    git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $PYENV_PLUGINS_DIR/pyenv-virtualenvwrapper
fi
