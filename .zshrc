export LANG=en_US.UTF-8

setopt prompt_subst 

# os detection
if [[ "$(uname)" == "Linux" ]]; then
    OS="Linux"
    alias ls='ls --color=always'
    ZSHSHPREFIX=/usr/share/zsh-syntax-highlighting
elif [[ "$(uname)" == "Darwin" ]]; then
    OS="macOS"
    alias ls='ls -G'
    ZSHSHPREFIX=${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/
else
    OS="Unknown"
fi

if [[ -n ${SSH_TTY} ]]; then
        RHOST="$(hostname) "
fi

PS1='%F{0}%B%(0?.%K{4} .%K{1} )%(1j.⚙ .)%K{0}%f ${RHOST}%~ %k%b ' # main prompt
PS2='%K{4} %K{0}%B + %b%k ' # multiline continuation
PS3='%K{4} %K{0}%B select %b%k ' # select

precmd() {
  RPROMPT="$(gitzsh)"
}

# zsh-syntax-highlighting
source ${ZSHSHPREFIX}/zsh-syntax-highlighting.zsh

