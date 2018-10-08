#!/bin/bash

# setup zsh
[ ! -e $(which zsh) ] && brew install zsh
[ ! -d ${HOME}/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# deploy dotfiles
DOTFILES_DIR=$(cd $(dirname $0) && pwd)
cd $DOTFILES_DIR
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv $DOTFILES_DIR/$f ${HOME}/$f
done
