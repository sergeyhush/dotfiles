# ss-dotfiles

My `.dotfiles` that for the most part will come from multiple sources.

## Features

* stow powered
* topical organization

## Directories naming (from F-dotfiles)

* lowercase for packages to install in $HOME (the default)
* titlecase for packages to install as root in / (eg @Daemon-osx)
* leading @ for environment packages and subpackages (eg @mac, attic/@Daemon-osx)
* leading _ for non packages meaning that these directories must not be stowed (eg _homebrew)

Having a convention for subpackage naming enable us to write a .stow-global-ignore
file so that subpackages are not symlinked when stowing parent package.

## Install

Run this:

```sh
git clone https://github.com/sergeyhush/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```
