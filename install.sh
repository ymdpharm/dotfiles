#!/bin/bash

# setup zsh
which zsh || brew install zsh
which zplug || curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# install peco
which peco || brew install peco

# deploy dotfiles
DOTFILES_DIR=$(cd $(dirname $0) && pwd)
cd $DOTFILES_DIR
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv $DOTFILES_DIR/$f ${HOME}/$f
done

