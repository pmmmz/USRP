#!/bin/bash
current_time=$(date "+%Y%m%d%H%M%S")
foldername=data$current_time
mkdir ./amari_data/$foldername
echo "FileName: " "$fileName"
for var in {0..3000000}
do
   echo $var
   ./ws.js 127.0.0.1:9001 '{"message": "ue_get", "stats":true}'>>./amari_data/$foldername/t$var.txt
   tail -n +6 ./amari_data/$foldername/t$var.txt >./amari_data/$foldername/j$var.json
   sleep 0.1

done
