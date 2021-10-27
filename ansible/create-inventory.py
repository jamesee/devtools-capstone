#!/usr/local/bin/python3

import json

with open('./ansible/test.json') as f:
  data_test = json.load(f)

print(data_test)

with open('./ansible/terraform-outputs.json') as f:
  print(f.read())
  data = json.load(f)
  
  # data = f.read()
  # dataJson = json.loads(data)

# print(data["values"]["outputs"]["ansible_inventory_file"]["value"]["content"])
print(data)
# print(dataJson)


# inventory = data["values"]["outputs"]["ansible_inventory_file"]["value"]["content"]

with open('./ansible/inventory.ini', 'w') as output_file:
  output_file.write(data["content"])
  # output_file.write(dataJson["content"])