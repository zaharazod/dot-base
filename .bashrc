source ~/.bash_include.sh
optsrc ~/.bash_aliases
optsrc ~/.bash_functions

for ROOT in /opt /opt/* /usr/local ~/.local ~/bin; do
  optpath "$ROOT/bin"
done

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=queSeraSera
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


if ! shopt -oq posix; then
  optsrc /usr/share/bash-completion/bash_completion
  optsrc /etc/bash_completion
  optsrc /opt/homebrew/etc/bash_completion
  optsrc "$HOME/.bash_completion"
fi


