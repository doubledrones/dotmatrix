# Together with preference Open files from applications: in the current window
# opening files in new tabs.

function mvi() {
  for FILE in $@
  do
    if [ ! -e $FILE ]; then
      touch $FILE
    fi
  done
  open -a MacVim --args $@
}
