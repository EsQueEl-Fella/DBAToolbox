#!/bin/bash
database=DBAToolbox
wait_time=15s
password='The_Very_Secret_Password123'

# wait for SQL Server to come up
echo importing data will start in $wait_time...
sleep $wait_time
echo importing data...

# run the init script to create the DB and the tables in /table
# /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U SA -P $password -i ./01_Body.sql

for entry in *.sql
do
  echo executing $entry
  /opt/mssql-tools/bin/sqlcmd -b -S 0.0.0.0 -U SA -P $password -i $entry
  if [ $? -eq 0 ]; then
    echo "Done."
  else
    /opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U SA -P $password -q "SHUTDOWN WITH NOWAIT"
    echo "Failed with $entry"
    exit 1
  fi
done