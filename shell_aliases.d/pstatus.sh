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
        "## staging")
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
      return 1
    fi
  done
}
