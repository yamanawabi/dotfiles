export LANG=en_US.UTF-8

setopt prompt_subst 

# os detection
if [[ "$(uname)" == "Linux" ]]; then
    OS="Linux"
elif [[ "$(uname)" == "Darwin" ]]; then
    OS="macOS"
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

# set zsh syntax highlighting prefix
if [[ ${OS} == "Linux" ]]; then
    ZSHSHPREFIX=/usr/share/zsh-syntax-highlighting
elif [[ ${OS} == "macOS" ]]; then
    ZSHSHPREFIX=${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/
else
    # nothing
fi

source ${ZSHSHPREFIX}/zsh-syntax-highlighting.zsh

# aliases
alias ls='ls -G'
