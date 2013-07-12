git_info() {
  # colors
  local     RESET="\033[0m"
  local      GRAY="\033[1;30m"
  local       RED="\033[1;31m"
  local     GREEN="\033[1;32m"
  local      BLUE="\033[1;34m"
  local      PINK="\033[1;35m"
  local      CYAN="\033[1;36m"

#  local      GOOD="\xe2\x88\x99"              # ∙   circle
#  local     AHEAD="\xe2\x86\x91"              # ↑   up arrow
#  local    BEHIND="\xe2\x86\x93"              # ↓   down arrow
#  local   CHANGED="\xcf\x9f"                  # ϟ   lightning
#  local  DIVERGED="\xe2\x86\x95"              # ↕   up-down
#  local UNTRACKED="\xe0\xb2\xa0_\xe0\xb2\xa0" # ಠ_ಠ disapproval
  local      GOOD="clean"              # ∙   circle
  local     AHEAD="ahead"              # ↑   up arrow
  local    BEHIND="behind"              # ↓   down arrow
  local   CHANGED="unclean"                  # ϟ   lightning
  local  DIVERGED="diverged"              # ↕   up-down
  local UNTRACKED="untracked" # ಠ_ಠ disapproval

  git_status() {
    local place=$(git status 2> /dev/null | head -n2 | tail -n1)
    local status=$(git status 2> /dev/null | tail -n1)

    if [[ $( echo $place | grep "Your branch is ahead of" ) != "" ]]; then
      echo -e "$PINK$AHEAD"
    elif [[ $( echo $place | grep "Your branch is behind" ) != "" ]]; then
      echo -e "$BLUE$BEHIND"
    elif [[ $( echo $place | grep "Your branch and .* have diverged" ) != "" ]]; then
      echo -e "$CYAN$DIVERGED"
    elif [[ $status != "nothing to commit (working directory clean)" ]]; then
      if [[ $status == 'nothing added to commit but untracked files present (use "git add" to track)' ]]; then
        echo -e "$GRAY$UNTRACKED"
      else
        echo -e "$RED$CHANGED"
      fi
    else
      echo -e "$GREEN$GOOD"
    fi
  }

  local branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")

  if [[ $branch != "" ]]; then
    echo -e "($branch:$(git_status)$RESET)"
  fi
}

# Example usage:
# $ source git_info.bash
# $ PS1="$(git_info) $PS1"
