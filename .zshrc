export LANG=en_US.UTF-8

# SPACESHIP_TIME_SHOW=true
# SPACESHIP_USER_SHOW=true
# SPACESHIP_BATTERY_SHOW=true
# source "$HOME/.zsh/spaceship/spaceship.zsh"

setopt prompt_subst 

if [[ -n ${SSH_TTY} ]]; then
        RHOST="$(hostname) "
fi

PS1='%F{0}%B%(0?.%K{4} .%K{1} )%(1j.⚙ .)%K{0}%f ${RHOST}%~ %k%b ' # main prompt
PS2='%K{4} %K{0}%B + %b%k ' # multiline continuation
PS3='%K{4} %K{0}%B select %b%k ' # select

precmd() {
  RPROMPT="$(gitzsh)"
}

source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls='ls -G'
