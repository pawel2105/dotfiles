export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
alias brake='bundle exec rake'
alias bespec='bundle exec spec'
alias ber="bundle exec rspec"
alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
alias gprs="git pull && rake spec && git push"
alias gco="git checkout"
alias pyserver="python -m SimpleHTTPServer 8000"
export PATH=/Users/cynicalgrinch/work/contiki-stage/bin:$PATH

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local WHITE="\[\033[1;37m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local DEFAULT="\[\e[0m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$GREEN[$DEFAULT\$(date +%H:%M)$GREEN]\
$GREEN[$DEFAULT\u@\h:$GREEN\w$RED\$(parse_git_branch)$GREEN]\
$GREEN\n>:$DEFAULT "
PS2='> '
PS4='+ '
}
proml

