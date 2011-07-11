function psetupall() {
  cd ~/projects

  if [ -z "$1" ]; then
    PROJECTS=*
  else
    PROJECTS="$@"
  fi
  for PROJECT in $PROJECTS
  do
    echo
    echo $PROJECT
    project_setup_rvm $PROJECT
    project_setup_bundle $PROJECT
    project_setup_db $PROJECT
    project_setup_bootstrap $PROJECT
  done
  echo
}
