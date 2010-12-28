function swap_monitor() {
  SWAP_TOTAL=`swap_total`
  if [ $SWAP_TOTAL -gt 2047 ]; then
    growlnotify -t "Swap Monitor" -m "You have a big swap: ${SWAP_TOTAL}M" -s
  fi
}
