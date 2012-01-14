function cpu_num() {
  case $UNAME in
    Linux)
      cat /proc/cpuinfo | grep "^processor" | wc -l
      ;;
    *)
      sysctl -n hw.ncpu
      ;;
  esac
}
