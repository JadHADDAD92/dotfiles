# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
path+=('/usr/local/bin')


HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd beep extendedglob nomatch notify promptsubst

# ctrl+<- | ctrl+->
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U +X bashcompinit && bashcompinit


eval "$(SHELL=/bin/sh lesspipe)"
CURRENT_DIR=$(dirname "$(realpath ${(%):-%N})")
. ~/.zsh_aliases
. ~/.zsh_completion
. $CURRENT_DIR/powerlevel10k/powerlevel10k.zsh-theme
. $CURRENT_DIR/zsh-you-should-use/you-should-use.plugin.zsh
. $CURRENT_DIR/F-Sy-H/F-Sy-H.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
