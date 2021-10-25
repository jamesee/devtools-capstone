#!/bin/bash

PUBLIC_IP=`terraform output instance_public_ip`
SERVER_NAME=`terraform output server_name`
KEY_NAME=`terraform output key_name`

echo "[servers]" > inventory.ini 
echo "$SERVER_NAME ansible_host=$PUBLIC_IP ansible_ssh_private_key_file=$KEY_NAME ansible_ssh_user=ubuntu" >> inventory.ini

