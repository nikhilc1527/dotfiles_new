[[ $TERM == "tramp" ]] && unsetopt zle && PS1='$ ' && return

COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
export ZSH_DISABLE_COMPFIX=true

fpath=("~/.config/zsh/completions/" $fpath)

autoload -U compinit
compinit

for config_file (~/.config/zsh/init_scripts/*.zsh); do
  source "$config_file"
done
unset custom_config_file

unsetopt share_history
export LANG=en_US.UTF-8
source ~/.bashrc
export HISTFILE="$XDG_CONFIG_HOME"/zsh/history
source ~/.zshenv
setopt interactivecomments

# bindkey -v # set vi mode
bindkey -e

alias src='source ~/.config/zsh/.zshrc'

eval "$(starship init zsh)"

# [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

preexec() { print -Pn "\e]0;$1\a" }
precmd() { print -Pn "\e]0;%n@%M:%~\a" }
