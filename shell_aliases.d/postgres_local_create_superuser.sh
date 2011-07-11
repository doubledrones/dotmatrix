function postgres_local_create_superuser() {
  ME=`whoami`

  for USERNAME in $@
  do
    psql -c "CREATE ROLE $USERNAME SUPERUSER LOGIN" postgres $ME
  done
}
