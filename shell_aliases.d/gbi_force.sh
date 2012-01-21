function gbi_force() {
  while true; do
    gem install bundler
    if [ $? -eq 0 ]; then
      bundle install && return 0
    fi
    sleep 5
  done
}
