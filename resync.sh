#!/bin/bash

current_foldername="notexist"
current_time=$(date "+%Y%m%d%H%M")
backupfolder=b$current_time


mkdir ./amari_data/labled_backup/$backupfolder
sleep 0.5
cp -r ./amari_data/demo/* ./amari_data/labled_backup/$backupfolder/
echo "previous data is backed up to folder $backupfolder"
rm -rf ./amari_data/demo/C*
rm -f /mnt/hgfs/pythonscripts/p*.txt
sshpass -p 'toor' rsync -avh root@192.168.10.10:/root/enb/doc/amari_data/ ./amari_data/
echo 'in sync'
for var in {0..10000}
do

if ls /mnt/hgfs/pythonscripts/p*.txt 1> ./title.txt 2>&1; then
    folder_name="$(ls /mnt/hgfs/pythonscripts/p*.txt | cut -c26-40)"
    sshpass -p 'toor' rsync -avh root@192.168.10.10:/root/enb/doc/amari_data/ ./amari_data/>new_file.txt
    sed -i '/json/!d' ./new_file.txt
    mkdir -p ./amari_data/demo/$folder_name
    echo "data sync to fodler $folder_name" 
    for file in $(<new_file.txt); do cp "./amari_data/$file" ./amari_data/demo/$folder_name; done >cplog.txt
else
    echo "wait"
fi
sleep 2
done
