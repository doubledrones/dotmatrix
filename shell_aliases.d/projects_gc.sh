function projects_gc() {
  cd ~/projects || exit 1
  for PROJECT in *
  do
    cd $PROJECT
    if [ $? -eq 0 ]; then
      echo
      echo $PROJECT
      git gc
      cd ..
    fi
  done
}
