function infinite() {
  ERR=0
  while [ $ERR -eq 0 ]
  do
    $*
    ERR=$?
  done
}
