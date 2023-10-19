export TASKDDATA="/var/lib/taskd"

function optsrc() {
  while [ -n "$1" ]; do
    [ -f "$1" ] && source "$1" #&& echo '$' || echo '!'
    shift
  done
}

function optpath() {
  while [ -n "$1" ]; do
    [ -d "$1" ] && PATH="$1:$PATH"
    shift
  done
}
