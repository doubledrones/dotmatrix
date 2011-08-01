function git_origin_pull() {
  if [ -f .git/config ]; then
    git config branch.master.remote origin
    git config branch.master.merge "refs/heads/master"
  else
    echo ".git/config not exist. Are you sure you are in proper directory?"
  fi
}
