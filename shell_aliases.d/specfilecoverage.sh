function specfilecoverage() {
  for FILE in `find app -type f`
  do
    case $FILE in
      *.swp)
        ;;
      *)
        if [ -f $FILE ]; then
          SPEC_FILE=`echo $FILE | sed -e 's/app\//spec\//g' | sed -e 's/\.rb//g'`_spec.rb
          if [ ! -f $SPEC_FILE ]; then
            echo "MISSING SPEC FOR: $FILE ($SPEC_FILE)"
          fi
        fi
        ;;
    esac
  done
}
