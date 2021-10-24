#!/bin/sh
set -eu

SSHPATH="$HOME/.ssh"

if [ ! -d "$SSHPATH" ]
then
  mkdir "$SSHPATH"
fi

if [ ! -f "$SSHPATH/known_hosts" ]
then
  touch "$SSHPATH/known_hosts"
fi

echo "$INPUT_KEY" > "$SSHPATH/james-sutd-ec2.pem"
KEYFILE="$SSHPATH/james-sutd-ec2.pem"

chmod 700 "$SSHPATH"
chmod 600 "$SSHPATH/known_hosts"
chmod 400 "$SSHPATH/james-sutd-ec2.pem"

# chown 1001:121 "$SSHPATH/known_hosts"
# chown 1001:121 "$SSHPATH/james-sutd-ec2.pem"


# echo $HOME
# echo $KEYFILE
# ls -al $HOME/.ssh


# sh -c "ssh -i $KEYFILE -o StrictHostKeyChecking=no -p 22 ubuntu@18.136.101.16 "

# cat $INPUT_INVENTORY
# cat $INPUT_PLAYBOOK

ansible-playbook "$INPUT_PLAYBOOK" -i "$INPUT_INVENTORY"

# if [ ! -z "$ANSIBLE_VAULT_PASSWORD" ]
# then
#       echo $ANSIBLE_VAULT_PASSWORD >> .vault;
#       ansible-playbook $1 -i $2 --vault-password-file .vault;
#       rm .vault
# else
#       ansible-playbook $1 -i $2
# fi

