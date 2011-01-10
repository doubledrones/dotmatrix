# useful to running bare commands when using aliases
#
# for example you have alias: alias rake="ssh host rake"
# you cannot run rake locally fast
# so you use: l rake
#
function l() {
  CMD=`which $1 2> /dev/null`
  if [ -z "$CMD" ]; then
    echo "Usage: l <system-commmand> [<optional-arguments>]"
    return 1
  fi
  if [ $# -eq 1 ]; then
    $CMD
  else
    $CMD `echo $@ | cut -f 2- -d " "`
  fi
}
