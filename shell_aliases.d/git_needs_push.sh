function git_needs_push() {
  if [ -z "`git st | grep "## master...origin/master \[ahead "`" ]; then
    return 1
  else
    return 0
  fi
}
