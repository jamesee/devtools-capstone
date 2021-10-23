#!/bin/bash

ls -al ~/

echo $SSH_PRIVATE_KEY > ~/.ssh/james-sutd-ec2.pem
chmod 400 ~/.ssh/james-sutd-ec2.pem

if [ ! -z "$ANSIBLE_VAULT_PASSWORD" ]
then
      echo $ANSIBLE_VAULT_PASSWORD >> .vault;
      ansible-playbook $1 -i $2 --vault-password-file .vault;
      rm .vault
else
      ansible-playbook $1 -i $2
fi

