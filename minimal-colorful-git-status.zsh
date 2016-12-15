minimal_vcs() {
  local branchName
  branchName="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"

  if [ -n "$branchName" ]; then
    local localRemoteState
    localRemoteState="$(git status --porcelain -b)"

    local color
    if echo "$localRemoteState" | grep -v '^##' &> /dev/null; then
      # dirty
      color="1" # red
    elif echo "$localRemoteState" | grep '^## .*diverged' &> /dev/null; then
      # diverged
      color="5" # magenta
    elif echo "$localRemoteState" | grep '^## .*behind' &> /dev/null; then
      # behind
      color="4" # blue
    elif echo "$localRemoteState" | grep '^## .*ahead' &> /dev/null; then
      # ahead
      color="7" # white
    else
      # clean
      color=$MINIMAL_OK_COLOR # green by default
    fi

    local formattedColor="%{\e[0;3${color}m%}"

    echo -n " $formattedColor$branchName%{\e[0m%}"
  fi
}
