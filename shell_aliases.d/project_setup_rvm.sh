function project_setup_rvm() {
  for PROJECT in $@
  do
    if [ -f $PROJECT/.rvmrc ]; then
      cd $PROJECT
      RVM_RUBY=`cat .rvmrc | grep "^rvm " | cut -f 2 -d ' ' | cut -f 1 -d \@`
      RVM_GEMSET=`cat .rvmrc | grep "^rvm " | cut -f 2 -d ' ' | cut -f 2 -d \@`
      if [ `ls -d $HOME/.rvm/rubies/$RVM_RUBY-* | wc -l` -eq 0 ]; then
        rvm install $RVM_RUBY
      fi
      cd ..
      cd $PROJECT
      if [ ! -z "$RVM_GEMSET" ]; then
        if [ ! -d $HOME/.rvm/gems/$RVM_RUBY-*@$RVM_GEMSET/ ]; then
          rvm gemset create "$RVM_GEMSET"
        fi
      fi
      cd ..
    fi
  done
}
