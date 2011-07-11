function project_setup_bootstrap() {
  for PROJECT in $@
  do
    if [ -f $PROJECT/Rakefile ]; then
      cd $PROJECT
      if [ -n "`rake -T | grep '^rake bootstrap '`" ]; then
        rake bootstrap
      else
        if [ -n "`rake -T | grep '^rake db:bootstrap '`" ]; then
          rake db:bootstrap
        fi
      fi
      cd ..
    fi
  done
}
