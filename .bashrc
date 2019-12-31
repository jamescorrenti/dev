. /usr/share/autojump/autojump.sh

export PS1="\[\033[37m\]\u:\[\033[32m\]\w\[\$(git_color)\]\$(git_branch)\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "

# Activate colors and dirty state
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true

# Get branch name
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' | sed 's/* \(.*\)/(\1)/'
}

COLOR_RED="\033[38;5;9m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[38;5;46m"
COLOR_PURPLE="\033[38;5;127m"
COLOR_BLUE="\033[38;5;32m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
COLOR_MERGE="\033[97;48;5;1m"

function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ $git_status =~ "Changes not staged for commit" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "diverged" ]]; then
        echo -e $COLOR_MERGE
    elif [[ $git_status =~ "Changes to be committed" ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "branch is ahead" ]]; then
        echo -e $COLOR_PURPLE
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_GREEN
    else    
        echo -e $COLOR_WHITE
    fi
}
