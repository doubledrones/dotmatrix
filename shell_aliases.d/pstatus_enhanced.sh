function pstatus_enhanced() {
  IGNORE_PROJECTS="$DOTMATRIX_CONF/pstatus.ignore_projects"
  IGNORE_GEMS_IN_PROJECTS="$DOTMATRIX_CONF/pstatus.ignore_gems_in_projects"
  IGNORE_RAILS_VERSION_IN_PROJECTS="$DOTMATRIX_CONF/pstatus.ignore_rails_version_in_projects"
  IGNORE_GEMCUTTER_GEM_SOURCE_IN_PROJECTS="$DOTMATRIX_CONF/pstatus.ignore_gemcutter_gem_source_in_projects"
  IGNORE_TO_DO_IN_PROJECTS="$DOTMATRIX_CONF/pstatus.ignore_todo_in_projects"
  CURRENT_RAILS_VERSION="3.0.10"

  if [ ! -d $DOTMATRIX_CONF ]; then
    mkdir -p $DOTMATRIX_CONF
  fi
  if [ ! -f $IGNORE_PROJECTS ]; then
    touch $IGNORE_PROJECTS
  fi
  if [ ! -f $IGNORE_GEMS_IN_PROJECTS ]; then
    touch $IGNORE_GEMS_IN_PROJECTS
  fi
  if [ ! -f $IGNORE_RAILS_VERSION_IN_PROJECTS ]; then
    touch $IGNORE_RAILS_VERSION_IN_PROJECTS
  fi
  if [ ! -f $IGNORE_GEMCUTTER_GEM_SOURCE_IN_PROJECTS ]; then
    touch $IGNORE_GEMCUTTER_GEM_SOURCE_IN_PROJECTS
  fi
  if [ ! -f $IGNORE_TO_DO_IN_PROJECTS ]; then
    touch $IGNORE_TO_DO_IN_PROJECTS
  fi

  cd ~/projects

  for PROJECT in *
  do
    if [ -z "`cat $IGNORE_PROJECTS | grep "^$PROJECT$"`" ]; then
      if [ -d $PROJECT/.git ]; then
        cd $PROJECT
        STATUS=`git st`
        case $STATUS in
          "## master")
            ;;
          "## staging")
            ;;
          *)
            echo
            echo $PROJECT
            git st
            ;;
        esac
        cd ..
      fi
      if [ -z "`cat $IGNORE_TO_DO_IN_PROJECTS | grep "^$PROJECT$"`" ]; then
        TO="TO"
        DO="DO"
        ack -1 $TO$DO $PROJECT
      fi
      if [ -f $PROJECT/Gemfile ]; then
        for REQUIRED_GEM in wirble hirb awesome_print
        do
          if [ -z "`cat $IGNORE_GEMS_IN_PROJECTS | grep "^$REQUIRED_GEM: $PROJECT$"`" ]; then
            if [ -z "`cat $PROJECT/Gemfile | grep $REQUIRED_GEM`" ]; then
              echo "$PROJECT: \"$REQUIRED_GEM\" gem not included in Gemfile"
            fi
          fi
        done
        if [ -z "`cat $IGNORE_RAILS_VERSION_IN_PROJECTS | grep "^$PROJECT$"`" ]; then
          DETECTED_RAILS_VERSION=`cat $PROJECT/Gemfile | grep "gem 'rails'"`
          if [ ! -z "$DETECTED_RAILS_VERSION" ]; then
            if [ -z "`cat $PROJECT/Gemfile | grep "gem 'rails', '$CURRENT_RAILS_VERSION'"`" ]; then
              echo "$PROJECT: does not use current rails version ($CURRENT_RAILS_VERSION), detected: $DETECTED_RAILS_VERSION"
            fi
          fi
        fi
        if [ -z "`cat $IGNORE_GEMCUTTER_GEM_SOURCE_IN_PROJECTS | grep "^$PROJECT$"`" ]; then
          HAS_GEMCUTTER_SOURCE=`cat $PROJECT/Gemfile | grep "^source :gemcutter$"`
          if [ -z "$HAS_GEMCUTTER_SOURCE" ]; then
            HAS_GEMCUTTER_SOURCE=`cat $PROJECT/Gemfile | grep "^source \"http://gemcutter.org\"$"`
            if [ -z "$HAS_GEMCUTTER_SOURCE" ]; then
              HAS_GEMCUTTER_SOURCE=`cat $PROJECT/Gemfile | grep "^source 'http://gemcutter.org'$"`
            fi
          fi
          if [ -n "$HAS_GEMCUTTER_SOURCE" ]; then
            echo "$PROJECT: has obsolete gemcutter source: $HAS_GEMCUTTER_SOURCE"
          fi
        fi
        if [ -n "`cat $PROJECT/Gemfile | grep heroku`" ]; then
          if [ -n "`cat $PROJECT/.gitignore | grep Gemfile.lock`" ]; then
            echo "$PROJECT: project is using Heroku but Gemfile.lock is in .gitignore"
            echo "$PROJECT: please remove proper line in .gitignore and add Gemfile.lock to repository"
          fi
        fi
      fi
    fi
  done
  echo
}
