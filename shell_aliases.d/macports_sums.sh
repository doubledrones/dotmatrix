function macports_sums() {
  MD5=`md5 "$@" | cut -f 2 -d = | cut -b 2-`
  SHA1=`sha1sum "$@" | cut -f 1 -d ' '`
  RMD160=`ripemd160sum "$@" | cut -f 1 -d ' '`

  echo "checksums           md5     $MD5 \\"
  echo "                    sha1    $SHA1 \\"
  echo "                    rmd160  $RMD160"
}
