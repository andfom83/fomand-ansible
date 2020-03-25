#!/bin/bash
# Location to place backups.
backup_dir="/backup/incoming"
name="$backup_dir/testdb-`date +%F--%H-%M`.sql.xz"

pg_dump -U postgres test --exclude-table-data=public.telescope_monitoring |xz -1 --threads=4 > $name
