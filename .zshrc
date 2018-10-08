### command
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
function history-all { history -E 1 }
setopt hist_ignore_dups
setopt share_history
autoload history-search-end

### set current dir to tab name
function chpwd() { 
 ls; echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
}

### iTerm2 bg color theme
### requires settings "Default", "remote"
function my_ssh() {
 case $1 in 
  *@* ) echo -e "\033]1337;SetProfile=remote\a" ;;
  * ) echo -e "\033]1337;SetProfile=Default\a" ;;
 esac
 trap "echo -e '\033]1337;SetProfile=Default\a'" 1 2 3 15
 trap "echo -e '\033]1337;SetProfile=Default\a'" EXIT
 ssh $@
}
alias ssh='my_ssh'

### plugin
source ${HOME}/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

