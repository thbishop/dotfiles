#!/bin/bash

set -e
# regular data
mkdir -p /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/bin /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/.courier /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store --exclude=vmware_related --exclude=vmware-vsphere-cli-distrib /Users/tbishop/Downloads /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store --exclude=vmware_related --exclude=vmware-vsphere-cli-distrib /Users/tbishop/Desktop /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/data /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/go /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/.ssh /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/.aws /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

cp /Users/tbishop/.gitconfig /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/
cp /Users/tbishop/.heirloom.yml /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/
cp /Users/tbishop/.simple_deploy.yml /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Movies /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Music /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Pictures /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/

mkdir -p /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/Library
rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /Users/tbishop/Library/Keychains /Volumes/EXTERNAL_1/laptop_backups/`hostname`/Users/tbishop/Library

# VMs
mkdir -p /Volumes/EXTERNAL_1/laptop_backups/`hostname`/vm
rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/intu_win.vmwarevm /Volumes/EXTERNAL_1/laptop_backups/`hostname`/vm/

#rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/centos_5u6_template.vmwarevm /Volumes/EXTERNAL_1/laptop_backups/`hostname`/vm/

#rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/lucid_64_template.vmwarevm /Volumes/EXTERNAL_1/laptop_backups/`hostname`/vm/

#rsync -ax --delete --progress --delete-excluded --exclude=.DS_Store /vm/bl-rhel6u0-1.0.x86_64.t6.tar.gz /Volumes/EXTERNAL_1/laptop_backups/`hostname`/vm/

# 1Password
mkdir -p /Volumes/EXTERNAL_1/laptop_backups/`hostname`/1password_backup
rm -f /Volumes/EXTERNAL_1/laptop_backups/`hostname`/1password_backup/*.agilekeychain_zip
cp "`ruby -e "puts Dir['/Users/tbishop/Library/Application Support/1Password/Backups/*'].sort_by{ |f| File.mtime(f) }.last"`" /Volumes/EXTERNAL_1/laptop_backups/`hostname`/1password_backup
