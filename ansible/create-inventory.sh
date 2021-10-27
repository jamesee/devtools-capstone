

# if [ $1 === "local" ] ;
# then
#     OUTPUT=`terraform show -json | jq ".values .root_module .resources | last .values .content"` 
# else
    OUTPUT=`cat ./ansible/terraform-outputs.json | jq ".values .root_module .resources | last .values .content"`
# fi

FINAL=`sed -e 's/^"//' -e 's/"$//' <<< "$OUTPUT"`

# echo -e "$FINAL"
echo -e "$FINAL" | tee ./ansible/inventory.ini 

# cat ../ansible/inventory.ini 