#!/bin/sh
set -eu

PUBLIC_IP_TEMP=`terraform output instance_public_ip`
PUBLIC_IP=`sed -e 's/^"//' -e 's/"$//' <<< "$PUBLIC_IP_TEMP"`

SERVER_NAME_TEMP=`terraform output server_name`
SERVER_NAME=`sed -e 's/^"//' -e 's/"$//' <<< "$SERVER_NAME_TEMP"`

KEY_NAME_TEMP=`terraform output key_name`
KEY_NAME=`sed -e 's/^"//' -e 's/"$//' <<< "$KEY_NAME_TEMP"`


echo -e "[servers]" > inventory.ini 
echo -e "$SERVER_NAME ansible_host=$PUBLIC_IP ansible_ssh_private_key_file=$KEY_NAME ansible_ssh_user=ubuntu" >> inventory.ini

