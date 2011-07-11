function project_setup_bundle() {
  for PROJECT in $@
  do
    if [ -f $PROJECT/Gemfile ]; then
      cd $PROJECT
      gem install bundler
      bundle install
      cd ..
    fi
  done
}

