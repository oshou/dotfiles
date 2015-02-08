#!/bin/sh
backupdir=/tmp/backup
backupdate=`date +%Y%m%d`
backupdatedir=${backupdir}/${backupdate}
mkdir ${backupdir}
mkdir ${backupdatedir}
echo "Start backup for ${backupdate}"
rsync -aur --delete /root/rails_pj/ ${backupdatedir}
echo "Complete backup for ${backupdate}!!"
