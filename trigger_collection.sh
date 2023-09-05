#!/bin/bash

SCRIPT="cd /root/enb/doc; ./data_fetch.sh "

for var in {0..10000}
do

if ls /mnt/hgfs/pythonscripts/p*.txt 1> ./title.txt 2>&1; then
        sshpass -p 'toor' ssh -l "root" "192.168.10.10" "${SCRIPT}"
else
    echo "wait"
fi
sleep 0.5
done
