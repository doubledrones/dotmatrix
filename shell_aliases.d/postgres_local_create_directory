function postgres_local_create_directory() {
  DB_ROOT="$MACPORTS_ROOT/var/db/postgresql84/defaultdb"
  if [ ! -d $DB_ROOT ]; then
    mkdir -p $DB_ROOT
    $MACPORTS_ROOT/lib/postgresql84/bin/initdb -D $DB_ROOT

    echo "--- defaultdb-vanilla/postgresql.conf	2011-04-01 12:22:20.000000000 +0200
+++ defaultdb/postgresql.conf	2011-04-01 12:33:11.000000000 +0200
@@ -56,12 +56,12 @@
 
 # - Connection Settings -
 
-#listen_addresses = 'localhost'		# what IP address(es) to listen on;
+listen_addresses = '127.0.0.1'		# what IP address(es) to listen on;
 					# comma-separated list of addresses;
 					# defaults to 'localhost', '*' = all
 					# (change requires restart)
-#port = 5432				# (change requires restart)
-max_connections = 30			# (change requires restart)
+#port = 5432				# (change requires restart)
+max_connections = 10			# (change requires restart)
 # Note:  Increasing max_connections costs ~400 bytes of shared memory per 
 # connection slot, plus lock space (see max_locks_per_transaction).
 #superuser_reserved_connections = 3	# (change requires restart)
@@ -104,7 +104,8 @@
 
 # - Memory -
 
-shared_buffers = 2400kB			# min 128kB
+#shared_buffers = 2400kB			# min 128kB
+shared_buffers = 128kB			# min 128kB
 					# (change requires restart)
 #temp_buffers = 8MB			# min 800kB
 #max_prepared_transactions = 0		# zero disables the feature
@@ -350,7 +351,7 @@
 					#   %% = '%'
 					# e.g. '<%u%%%d> '
 #log_lock_waits = off			# log lock waits >= deadlock_timeout
-#log_statement = 'none'			# none, ddl, mod, all
+log_statement = 'all'			# none, ddl, mod, all
 #log_temp_files = -1			# log temporary files equal or larger
 					# than the specified size in kilobytes;
 					# -1 disables, 0 logs all temp files" | patch -p1 $MACPORTS_ROOT/var/db/postgresql84/defaultdb/postgresql.conf
  fi
}
