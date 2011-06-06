function sshfs_rebuild() {
  PORT=`ls ~/.macports/bin/port`
  sudo $PORT uninstall sshfs
  sudo $PORT uninstall macfuse
  sudo $PORT install macfuse
  $PORT install sshfs
}
