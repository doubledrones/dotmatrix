function git_create_branch() {
  for BRANCH in $1
  do
    git push origin origin:refs/heads/$BRANCH
    git_track_branch $BRANCH
  done
}
