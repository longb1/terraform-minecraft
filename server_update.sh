#!/bin/bash
#work in progress
mkdir "serverfiles$(date +'%d-%m-%Y')" #create folder name with todays date
wget -qO - "${mojang_server_url}" | bsdtar -xvf- -C ./"serverfiles$(date +'%d-%m-%Y')" 
#chmod +x bedrock_server