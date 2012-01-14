function compile_shell_aliases() {
  ALIASES="$HOME/.shell_aliases"
  LOCAL_ALIASES_D="$HOME/.shell_aliases.local.d"
  echo "# This file will be replaced by running command 'compile_shell_aliases'" > $ALIASES
  echo "#" >> $ALIASES
  echo "# Please use $LOCAL_ALIASES_D to storage your own aliases" >> $ALIASES
  echo "DOTMATRIX_CONF=\"$HOME/.dotmatrix\"" >> $ALIASES
  echo "MACPORTS_ROOT=\"$HOME/.macports\"" >> $ALIASES
  echo "UNAME=\"`uname`\"" >> $ALIASES
  for DIR in $ALIASES.d $LOCAL_ALIASES_D
  do
    if [ -d $DIR ]; then
      for FILE in $DIR/*
      do
        cat $FILE | grep -v "^#" >> $ALIASES
      done
    fi
  done
  for X in 1 2 3 4 5 6 7
  do
    cat $ALIASES | sed -e "s/^  //g" >> $ALIASES.tmp
    mv $ALIASES.tmp $ALIASES
  done
}
