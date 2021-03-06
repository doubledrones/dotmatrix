function ppullall() {
  cd ~/projects

  for PROJECT in *
  do
    if [ -d $PROJECT/.git ]; then
      cd $PROJECT
      if `git_clean`; then
        echo
        echo "$PROJECT"
        git pull
      fi
      cd ..
    fi
  done
  echo
}
