source "$HOME/.colors.sh"
# put a basic xterm title up
printf "\033]0;%s\007" "`whoami`@`hostname -s`"

DIRCOLOR="$BLACK$BG2"
PIPECOLOR="$NORMAL\[\033[02;${PCOLOR}m\]"
HOSTCOLOR="\[\033[${HCOLOR}m\]"
HOSTCOLORDIM="\[\033[02;${HCOLOR}m\]"
SWISH="█▓▒░"

SPACE='  '
SPACE2='    '

COL_BUMP="${NORMAL}${DIM}${CYAN}"
COL_DATE="${BOLD}${WHITE}${BLUEBG}"
COL_BAR="${DIM}${CYAN}"
COL_TIME="${NORMAL}${WHITE}${BLUEBG}"
COL_FADE1="${NORMAL}${LIGHT}${CYAN}${BLUEBG}"
COL_USER="${NORMAL}${BOLD}${BLACK}${BLUEBG}"
COL_HOST="${NORMAL}${BOLD}${BLACK}${BLUEBG}"
COL_FADE2="${NORMAL}${CYAN}"
COL_BULLET="${BOLD}${DIM}${CYAN}"

optsrc "$HOME/.hosts.sh"

function prompt_pre() {
  which deactivate >/dev/null 2>&1 && deactivate
  BASE=$(basename $PWD)
  for j in env venv; do
    for i in "$PWD/.$j" "$HOME/.$j/$BASE"; do
      optsrc "$i/bin/activate"
    done
  done

  unset GIT
  declare -A GIT
  GIT_STATUS=$(git status -b --porcelain=1 2>&1)
  if [[ ! $GIT_STATUS =~ fatal ]]; then
    GIT[NAME]=$(git config --get remote.origin.url | sed -e 's/^.*\/\([^/.]*\).*/\1/' 2>&1)
    GIT[BRANCH]=$(git branch --show-current 2>&1)
    if [[ $GIT_STATUS =~ behind ]]; then GIT[BEHIND]="«"; fi
    if [[ $GIT_STATUS =~ ahead ]]; then GIT[AHEAD]="»"; fi
    if [[ $GIT_STATUS =~ \?\? ]]; then GIT[UNTRACKED]="?"; fi
    if [[ $GIT_STATUS =~ \ M\  ]]; then GIT[MODIFIED]="¤"; fi
  fi
  DDATE=$(ddate +%A 2>/dev/null || date +%A 2>/dev/null)
  TIME=$(date +%I%M)
  DISPLAY_PATH=$(
    p="${PWD#${HOME}}"
    [ "${PWD}" != "${p}" ] && printf "~"
    IFS=/
    for q in ${p:1}; do printf /${q:0:1}; done
    printf "${q:1}"
  )
  PS1="\033]0;$USER@$HOST: ${DISPLAY_PATH} | ${GIT[ORIGIN]} ${GIT[BRANCH]:+(${GIT[BRANCH]})} ${GIT[UNTRACKED]:+\?}${GIT[MODIFIED]:+*}\007\
${COL_BUMP}▄\
${COL_DATE}\
$SPACE2$DDATE${SPACE}${COL_BAR}│$SPACE${COL_TIME}$TIME$SPACE2${COL_FADE1}▒░\
${debian_chroot:+($debian_chroot) }\
${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }\
${COL_USER}\
$SPACE\u\
${COL_HOST}\
\h$SPACE${NORMAL}${CYAN}▒░\
$NORMAL$SPACE${GIT[NAME]}${COL_BULLET} ■ $NORMAL$BOLD$WHITE${GIT[BRANCH]}\
$BOLD$DIM$BLUE${GIT[BEHIND]}\
$SPACE$BOLD$YELLOW${GIT[MODIFIED]}\
$BOLD$RED${GIT[UNTRACKED]}\
$BOLD$DIM$GREEN${GIT[AHEAD]}\

${COL_BUMP}▀$NORMAL ${DISPLAY_PATH} \
$NORMAL$BOLD\$$NORMAL "

  cols=$(tput cols)
  if [[ -v simple || $cols -lt 60 ]]; then
    PS1="\
${VIRTUAL_ENV:+$FG4($WHITE$(basename $VIRTUAL_ENV)$FG4) }\
$GREEN\u\
$PURPLE@\
$GREEN\h:\
$BOLD$BLUE $DISPLAY_PATH \
$NORMAL$WHITE\$ \
"
  fi
}

PROMPT_COMMAND='prompt_pre'
trap 'printf "\033]0;%s\007" "${BASH_COMMAND//[^[:print:]]/}"' DEBUG
