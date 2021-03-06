function specfilenamecorrect() {
  for FILE in `find app -type f`
  do
    case $FILE in
      *.swp)
        ;;
      *)
        if [ -f $FILE ]; then
          SPEC_FILE=`echo $FILE | sed -e 's/app\//spec\//g' | sed -e 's/\.rb//g'`_spec.rb
          if [ ! -f $SPEC_FILE ]; then
            ALTERNATIVE_SPEC_FILE=`echo $SPEC_FILE | sed -e 's/\.erb//g'`
            if [ -f $ALTERNATIVE_SPEC_FILE ]; then
              echo mv $ALTERNATIVE_SPEC_FILE $SPEC_FILE
              mv $ALTERNATIVE_SPEC_FILE $SPEC_FILE
            fi
          fi
        fi
        ;;
    esac
  done
}
