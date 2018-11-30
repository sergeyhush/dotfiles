# Setup Pyenv
# Check if installed manually
FOUND_PYENV=0
pyenvdirs=("$HOME/.pyenv" "/usr/local/pyenv" "/opt/pyenv")

for pyenvdir in "${pyenvdirs[@]}" ; do
    if [ -d $pyenvdir/bin -a $FOUND_PYENV -eq 0 ] ; then
        FOUND_PYENV=1
        export PYENV_ROOT=$pyenvdir
        export PATH=${pyenvdir}/bin:$PATH
        eval "$(pyenv init - zsh)"
        break
    fi
done
unset pyenvdir

if [ $FOUND_PYENV -eq 0 ] ; then
    # Check if installed automatically (via Homebrew for example)
    pyenvdir=$(brew --prefix pyenv 2> /dev/null)
    if [ $? -eq 0 -a -d $pyenvdir/bin ] ; then
        FOUND_PYENV=1
        export PYENV_ROOT=$pyenvdir
        export PATH=${pyenvdir}/bin:$PATH
        eval "$(pyenv init - zsh)"
    fi
fi

# Setup Virutalenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
virtualenvwrapper='virtualenvwrapper.sh'

# source ${${virtualenvwrapper}:c}
pyenv virtualenvwrapper

if ! type workon &>/dev/null; then
    print "shell function 'workon' not defined.\n"\
        "Please check ${virtualenvwrapper}" >&2
    return
fi

if [[ "$WORKON_HOME" == "" ]]; then
  print "\$WORKON_HOME is not defined so virtualenvwrapper will not work" >&2
  return
fi

