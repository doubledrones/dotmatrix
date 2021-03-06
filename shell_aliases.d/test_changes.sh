function test_changes() {
  SPEC_FILES=`git st | grep '_spec.rb$' | cut -f 3 -d " "`
  if [ -n "$SPEC_FILES" ]; then
    echo "Running specs:"
    echo "$SPEC_FILES"
    spec $SPEC_FILES --color --format specdoc || return $?
  fi

  CUCUMBER_FILES=`git st | grep '.feature$' | cut -f 3 -d " "`
  if [ -n "$CUCUMBER_FILES" ]; then
    echo "Running cucumbers:"
    echo "$CUCUMBER_FILES"
    cucumber --format pretty $CUCUMBER_FILES || return $?
  fi
}
