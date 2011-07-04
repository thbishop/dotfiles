#!/bin/bash
# regular data
mkdir -p /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop
rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/bin /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store --exclude=vmware_related --exclude=vmware-vsphere-cli-distrib /Users/tbishop/Downloads /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/data /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Movies /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Music /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Pictures /Volumes/VOLUME_1/laptop_backups/`hostname`/Users/tbishop/

# VMs
mkdir -p /Volumes/VOLUME_1/laptop_backups/`hostname`/vm
rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/tbishop_vm.vmwarevm /Volumes/VOLUME_1/laptop_backups/`hostname`/vm/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/centos_5u6_template.vmwarevm /Volumes/VOLUME_1/laptop_backups/`hostname`/vm/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/lucid_64_template.vmwarevm /Volumes/VOLUME_1/laptop_backups/`hostname`/vm/

# 1Password
mkdir -p /Volumes/VOLUME_1/laptop_backups/`hostname`/1password_backup
rm -f /Volumes/VOLUME_1/laptop_backups/`hostname`/1password_backup/*.agilekeychain_zip
cp "`ruby -e "puts Dir['/Users/tbishop/Library/Application Support/1Password/Backups/*'].sort_by{ |f| File.mtime(f) }.last"`" /Volumes/VOLUME_1/laptop_backups/`hostname`/1password_backup
