function project_setup_db() {
  for PROJECT in $@
  do
    if [ -f $PROJECT/config/database.yml ]; then
      for DB_USER in `cat $PROJECT/config/database.yml | grep username: | grep -v "<<:" | sort | uniq | cut -f 2 -d :`
      do
        postgres_local_create_superuser $DB_USER
      done
      cd $PROJECT
      rake db:create
      rake db:migrate
      rake db:seed
      rake db:test:clone
      cd ..
    fi
  done
}
