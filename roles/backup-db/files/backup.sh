#!/bin/bash
# Julius Zaromskis, Andrii Fomin
# Backup rotation

# Storage folder where to move backup files
# Must contain backup.monthly backup.weekly backup.daily folders
storage=/backup

# Source folder where files are backed
source=$storage/incoming

# Destination file names
date_daily=`date +"%d-%m-%Y"`
date_hourly=`date +"%H-%d-%m-%Y"`
#date_weekly=`date +"%V sav. %m-%Y"`
#date_monthly=`date +"%m-%Y"`

# Get current month and week day number
month_day=`date +"%d"`
week_day=`date +"%u"`
hour=`date +"%H"`

# Optional check if source files exist. Email if failed.
#if [ ! -f $source/archive.tgz ]; then
#ls -l $source/ | mail ak@boosteroid.com -s "[backup script] Daily backup failed! Please check for missing files."
#fi

# It is logical to run this script daily. We take files from source folder and move them to
# appropriate destination folder

# On first month day do
if [ "$month_day" -eq 1 ] && [ "$hour" -eq 0 ]; then
    destination=$storage/backup.monthly/$date_daily
  elif [ "$week_day" -eq 6 ] && [ "$hour" -eq 0 ]; then # On saturdays do
    destination=$storage/backup.weekly/$date_daily
  elif [ "$hour" -eq 0 ]; then
    # On any regular day do
    destination=$storage/backup.daily/$date_daily
  else
    # during day do
    destination=$storage/backup.hourly/$date_hourly
fi

# Move the files
mkdir -p $destination
mv -v $source/* $destination
#hourly - keep for 24 hours
find $storage/backup.hourly/ -maxdepth 1 -mmin +1440 -type d -exec rm -rv {} \;

# daily - keep for 7 days
find $storage/backup.daily/ -maxdepth 1 -mtime +7 -type d -exec rm -rv {} \;

# weekly - keep for 30 days
find $storage/backup.weekly/ -maxdepth 1 -mtime +60 -type d -exec rm -rv {} \;

# monthly - keep for 300 days
find $storage/backup.monthly/ -maxdepth 1 -mtime +300 -type d -exec rm -rv {} \;
