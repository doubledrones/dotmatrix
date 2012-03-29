function rvm_gems_reset() {
  echo "This will remove your Gemfile.lock and `rvm gemdir`"
  read -p "Are you sure (yN)? "

  if [ "$REPLY" == "y" ]
  then
    rm -rf `rvm gemdir` && \
    gem install bundler && \
    bundle install
  fi
}
