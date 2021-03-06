function ppushall() {
  cd ~/projects

  for PROJECT in *
  do
    if [ -d $PROJECT/.git ]; then
      cd $PROJECT
      if `git_needs_push`; then
        echo
        echo "$PROJECT"
        git push
      fi
      cd ..
    fi
  done
  echo
}
