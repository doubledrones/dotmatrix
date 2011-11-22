function pstatus() {
  cd ~/projects

  for PROJECT in *
  do
    echo " => $PROJECT"
    if [ -d $PROJECT/.git ]; then
      cd $PROJECT
      STATUS=`git st`
      case $STATUS in
        "## master")
          ;;
        *)
          echo
          git st
          return 1
          ;;
      esac
      cd ..
    else
      echo "$PROJECT: missing git"
    fi
  done
}
