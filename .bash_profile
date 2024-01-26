# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source "$HOME/.profile"
source "$HOME/.bashrc"

let TIMEOUT=4
################
ssh-agent-check
# conditional?
which vcsh > /dev/null && \
  echo "Updating vcsh repositories.." && \
  timeout -s 9 $TIMEOUT vcsh pull
which task > /dev/null && \
  echo "Synchronizing taskwarrior tasks.." && \
  timeout -s 9 $TIMEOUT task sync

fortune -s
################
