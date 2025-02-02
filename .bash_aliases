# preference/version-lock
which python3 >/dev/null && alias python=python3

# django dev
alias mbmewatch='inotifywait --csv --recursive --monitor --event modify --include ".*\.(html|py|json)\$" /srv/mattbarry.me/mbme/ | while read change; do echo \"$? $change\"; sleep 2; touch /srv/mattbarry.me/mbme/awa/wsgi.py ; done'
alias mbme='pushd /srv/mattbarry.me/mbme && ./manage.py shell && popd'

# python #
alias testpypi='[ -d dist ] && rm -f dist/* && python -m build && twine upload --repository testpypi dist/*'
alias pypi='[ -d dist ] && rm -f dist/* && python -m build && twine upload --repository pypi dist/*'
alias tf='terraform'
alias tfi='tf init'
alias tfp='tf plan'
alias tfa='tf apply'


# speling
which vi >/dev/null        && alias bu=vi && alias bi=vi
which git >/dev/null       && alias got=git && alias gut=git
which yarn >/dev/null      && alias yawn=yarn

# shortcut
alias hgrep="history|grep"
alias be='bundle exec'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# color
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias diff='diff --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ip='ip -color=auto'
fi

# git
alias gc="git commit -am '$*'"
alias ga="git add $*"
alias gl="git list $*"
alias gd="git diff $*"
alias gu="git pull"
alias gcp="git commit -am '$*' && git push"

# debian
alias up="sudo apt --update full-upgrade --install-suggests --install-recommends --auto-remove -y && sudo apt autoclean"

