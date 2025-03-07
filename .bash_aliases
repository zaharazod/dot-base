# preference/version-lock
which python3 >/dev/null && alias python=python3

# django dev
alias mbmewatch='inotifywait --csv --recursive --monitor --event modify --include ".*\.(html|py|json)\$" /srv/mattbarry.me/mbme/ | while read change; do echo \"$? $change\"; sleep 2; touch /srv/mattbarry.me/mbme/awa/wsgi.py ; done'

# python #
alias testpypi='[ -d dist ] && rm -f dist/* && python -m build && twine upload --repository testpypi dist/*'
alias pypi='[ -d dist ] && rm -f dist/* && python -m build && twine upload --repository pypi dist/*'

# terraform
alias tf='terraform -chdir=/home/matt/hack/control/terraform/'
alias tfi='tf init'
alias tfp='tf plan'
alias tfa='tf apply -auto-approve -compact-warnings'
alias tfc='tf console'

# git
alias gc="git commit -am '$*'"
alias ga="git add $*"
alias gl="git list $*"
alias gd="git diff $*"
alias gu="git pull"
alias gcp="git commit -am '$*' && git push"

# debian
alias up="sudo apt --update full-upgrade --install-suggests --install-recommends --auto-remove -y && sudo apt autoclean"
alias a2="sudo systemctl restart apache2"

# speling
which vi >/dev/null        && alias bu=vi && alias bi=vi && alias vo=vi
which git >/dev/null       && alias got=git && alias gut=git && alias gti=git
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

alias db='gbp buildpackage --git-ignore-new --git-ignore-branch'
alias dt='TMPDIR=/var/tmp debian/rules clean && autopkgtest . -- unshare --release=unstable 2>&1'
