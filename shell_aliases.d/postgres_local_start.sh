function postgres_local_start() {
  if [ -f $MACPORTS_ROOT/lib/postgresql91/bin/postgres ]; then
    $MACPORTS_ROOT/lib/postgresql91/bin/postgres -D $MACPORTS_ROOT/var/db/postgresql91/defaultdb
  elif [ -f $MACPORTS_ROOT/lib/postgresql84/bin/postgres ]; then
    $MACPORTS_ROOT/lib/postgresql84/bin/postgres -D $MACPORTS_ROOT/var/db/postgresql84/defaultdb
  else
    echo "ERROR: PostgreSQL not found"
  fi
}
