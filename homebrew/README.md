# Homebrew

To create the packages list do :

    brew leaves | sort > Brewfile

To install brew-ed packages:

    cat Brewfile | xargs brew install
