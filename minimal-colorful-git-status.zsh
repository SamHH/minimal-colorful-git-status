# Vars with default fallback settings
MINIMAL_GIT_DIRTY_COLOR="${MINIMAL_GIT_DIRTY_COLOR:-1}" # red
MINIMAL_GIT_DIVERGED_COLOR="${MINIMAL_GIT_DIVERGED_COLOR:-5}" # magenta
MINIMAL_GIT_BEHIND_COLOR="${MINIMAL_GIT_BEHIND_COLOR:-4}" # blue
MINIMAL_GIT_AHEAD_COLOR="${MINIMAL_GIT_AHEAD_COLOR:-7}" # white
MINIMAL_GIT_CLEAN_COLOR="${MINIMAL_GIT_CLEAN_COLOR:-2}" # green

minimal_vcs() {
  local branchName
  branchName="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

  if [ -n "$branchName" ]; then
    local localRemoteState
    localRemoteState="$(git status --porcelain -b)"

    local color

    # dirty
    if echo "$localRemoteState" | grep -v '^##' &> /dev/null; then
      color=$MINIMAL_GIT_DIRTY_COLOR

    # diverged
    elif echo "$localRemoteState" | grep '^## .*diverged' &> /dev/null; then
      color=$MINIMAL_GIT_DIVERGED_COLOR

    # behind
    elif echo "$localRemoteState" | grep '^## .*behind' &> /dev/null; then
      color=$MINIMAL_GIT_BEHIND_COLOR

    # ahead
    elif echo "$localRemoteState" | grep '^## .*ahead' &> /dev/null; then
      color=$MINIMAL_GIT_AHEAD_COLOR

    # clean
    else
      color=$MINIMAL_GIT_CLEAN_COLOR
    fi

    local formattedColor="%{\e[0;3${color}m%}"

    echo -n " $formattedColor$branchName%{\e[0m%}"
  fi
}
