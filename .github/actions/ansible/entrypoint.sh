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

# ls -al 
# ls -al ansible/
# sh -c "ssh -i $KEYFILE -o StrictHostKeyChecking=no -p 22 ubuntu@18.136.101.16 "

cp ./ansible/ansible.cfg .

cat ./ansible/test.json | jq .

# sed --verison

# bash ./terraform/create-inventory.sh
# cat ./ansible/terraform-outputs.json
jq '.values' < $(cat ./ansible/terraform-outputs.json)

# cat ./ansible/terraform-outputs.json | jq ".values "
# OUTPUT=`cat ./ansible/terraform-outputs.json | jq ".values .root_module .resources | last .values .content"`
# FINAL=`sed -e 's/^"//' -e 's/"$//' <<< "$OUTPUT"`
# echo -e "$FINAL"
# echo -e "$FINAL" | tee ./ansible/inventory.ini 
# cat ./ansible/inventory.ini

ansible-playbook "$INPUT_PLAYBOOK" -i "$INPUT_INVENTORY"

# if [ ! -z "$ANSIBLE_VAULT_PASSWORD" ]
# then
#       echo $ANSIBLE_VAULT_PASSWORD >> .vault;
#       ansible-playbook $1 -i $2 --vault-password-file .vault;
#       rm .vault
# else
#       ansible-playbook $1 -i $2
# fi

