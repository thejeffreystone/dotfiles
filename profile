# My aliaes
alias clrmenus='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias ll="ls -aloFG"
alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'
alias now='echo -e "The time is now $(date +%r) on $(date +%A), $(date +%B) $(date +%d) $(date +%Y)."'

# Git functions
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
function getGitCurrentBranch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\ \1/'
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# My Command Prompt
export PS1="\u@\h: \W\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "

# My Path
export PATH=.:~/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/local/mysql/bin:/usr/local/php:/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$(brew --prefix josegonzalez/php/php56)/bin:$PATH"
# Setting PATH for Python 3.5
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
