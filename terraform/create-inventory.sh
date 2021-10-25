#!/bin/bash

# OUTPUT=`terraform show -json | jq ".values .root_module .resources | last .values .content"`
OUTPUT=`cat terraform-outputs.json | jq ".values .root_module .resources | last .values .content"`

FINAL=`sed -e 's/^"//' -e 's/"$//' <<< "$OUTPUT"`

echo -e "$FINAL" | tee ../ansible/inventory.ini 

cat ../ansible/inventory.ini 