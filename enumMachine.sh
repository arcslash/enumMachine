#!/bin/bash

# Constats
OUTPUT_FOLDER="output"
NMAP_SCANS_FOLDER="scans"
TARGET_IP=$1
echo "[+]Starting Up Enum Machine"
# Creating up Output Folders If does not exist
check_dir_exist(){
	if [ -d $1 ]
	then
		echo "\e[32m[+]Directory Exists on the File System"
		rm "${1}/*"
	else
		echo "\e[31m[-]Directory Does Not Exist"
		mkdir $1
		echo "\e[32m[+]Making Output Directory"
	fi
}
check_dir_exist $OUTPUT_FOLDER
echo "\e[31m[+]Running nmap top 1000 port scan"
check_dir_exist "${OUTPUT_FOLDER}/${NMAP_SCANS_FOLDER}"
sudo nmap -sC -sV -A -oN "${OUTPUT_FOLDER}/test" $TARGET_IP
