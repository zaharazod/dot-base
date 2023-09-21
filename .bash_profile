# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

X=`realpath "${BASH_SOURCE[0]}"` X=`dirname "$X"` X=`realpath "$X/../.."` DOT_ROOT=$X
source "$HOME/.bash_include.sh"

HOST=`hostname -s`
EMAIL="matt@hazelmollusk.org"
DEBEMAIL="matt@hazelmollusk.org"
DEBFULLNAME="Matt Barry"
DEBNAME=$DEBFULLNAME
export EMAIL DEBEMAIL DEBFULLNAME DEBNAME

source ~/.bashrc
source ~/.bash_aliases

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

# put a basic xterm title up
printf "\033]0;%s\007" "`whoami`@`hostname -s`"

if ! shopt -oq posix; then
  optsrc /usr/share/bash-completion/bash_completion
  optsrc /etc/bash_completion
  optsrc /opt/homebrew/etc/bash_completion
fi

optsrc "$HOME/.prompt.sh"
optsrc "$HOME/.bash_profile.private"
optsrc "$HOME/.bash_profile.local"

##########
which vcsh > /dev/null && \
  echo "Updating vcsh repositories.." && \
  vcsh pull
which task > /dev/null && \
  echo "Synchronizing taskwarrior tasks.." && \
  task sync
##########
fortune -s
##########
