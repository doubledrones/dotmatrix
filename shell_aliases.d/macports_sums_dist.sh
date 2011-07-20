function macports_sums_dist() {
  for PORT in $@
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
