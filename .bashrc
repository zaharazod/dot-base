X=`realpath "${BASH_SOURCE[0]}"` X=`dirname "$X"` X=`realpath "$X/../.."` DOT_ROOT=$X
source ~/.bash_include.sh

optpath ~/bin:$PATH
for ROOT in /opt /opt/* /usr/local; do
  optpath "$ROOT/$APP/bin"
done

optpath ~/.local/bin ~/bin
