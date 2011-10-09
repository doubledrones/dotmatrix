function macports_sums_dist() {
  case $1 in
    '')
      PORTS=`cd ~/.macports/var/macports/distfiles && ls`
      ;;
    *)
      PORTS="$@"
      ;;
  esac
  for PORT in $PORTS
  do
    for FILE in ~/.macports/var/macports/distfiles/$PORT/*
    do
      echo
      echo $FILE
      echo
      macports_sums $FILE
    done
    echo
    echo
  done
}
