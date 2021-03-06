function cucumber_each() {
  DONE=`cat cucumber_each.done`

  for FEATURE in `ls -dr features/*.feature`
  do
    case $DONE in
      *$FEATURE*)
        echo "Ommiting done feature: $FEATURE"
        ;;
      *)
        case $@ in
          *$FEATURE*)
            echo "Ommiting feature: $FEATURE"
            ;;
          *)
            echo
            echo $FEATURE
            echo
            cucumber $FEATURE ; ERR=$?
            if [ $ERR -eq 0 ]; then
              echo $FEATURE >> cucumber_each.done
            else
              mvi $FEATURE
              return $ERR
            fi
            echo
            ;;
        esac
        ;;
    esac
  done
}
