function git_track_branch() {
  for BRANCH in $1
  do
    git fetch origin
    git checkout --track -b $BRANCH origin/$BRANCH
    git pull
  done
}
