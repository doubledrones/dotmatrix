function git_clean() {
  if [ -z "`git st | grep -v "## master"`" ]; then
    return 0
  else
    return 1
  fi
}
