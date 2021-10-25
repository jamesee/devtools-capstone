#!/usr/local/bin/python3

import json

with open('./ansible/test.json') as f:
  data_test = json.loads(f)

print(data_test)

with open('./ansible/terraform-outputs.json') as f:
  data = json.loads(f)

# print(data["values"]["outputs"]["ansible_inventory_file"]["value"]["content"])
print(data["content"])


# inventory = data["values"]["outputs"]["ansible_inventory_file"]["value"]["content"]

with open('./ansible/inventory.ini', 'w') as output_file:
  output_file.write(data["content"])