function plognull() {
  echo

  case $1 in
    "")
      PROJECTS=`find ~/projects -type d -maxdepth 1`
      ;;
    *)
      for PROJECT in $@
      do
        PROJECTS="$PROJECTS `find ~/projects -type d -maxdepth 1 -name $PROJECT`"
      done
      ;;
  esac

  for PROJECT in $PROJECTS
  do
    if [ -d $PROJECT/log ]; then
      for LOG in development.log newrelic_agent.log production.log test.log staging.log
      do
        if [ -f $PROJECT/log/$LOG ]; then
          echo "Log nulled: $PROJECT/log/$LOG"
          ln -sf /dev/null $PROJECT/log/$LOG
        fi
      done
    fi
  done

  echo
}
