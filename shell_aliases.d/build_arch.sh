function build_arch() {
  if [ `uname -p | grep powerpc | wc -l | cut -b8` -eq 1 ]; then
    echo ppc
  else
    if [ `/usr/sbin/sysctl -n hw.optional.x86_64 2>/dev/null` -eq 1 ]; then
      echo x86_64
    else
      echo i386
    fi
  fi
}
