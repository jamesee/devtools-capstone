#!/usr/bin/python3

import json

with open('./ansible/terraform-outputs.json') as f:
  data = json.load(f)

print(data["values"]["outputs"]["ansible_inventory_file"]["value"]["content"])

inventory = data["values"]["outputs"]["ansible_inventory_file"]["value"]["content"]
with open('./ansible/inventory.ini', 'w') as f:
  f.write(inventory)