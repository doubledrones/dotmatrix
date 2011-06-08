function gem_exist() {
  for GEM in $@
  do
    ON_RUBYGEMS=`gem list -r --source http://rubygems.org | grep $GEM`
    if [ -n "$ON_RUBYGEMS" ]; then
      echo "Gem '$GEM' exist on RubyGems: $ON_RUBYGEMS"
    else
      ON_GITHUB=`gem list -r --source http://gems.github.com | grep $GEM`
      if [ -n "$ON_GITHUB" ]; then
        echo "Gem '$GEM' exist on GitHub: $ON_GITHUB"
      fi
    fi
  done
}
