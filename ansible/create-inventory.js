
const fs = require('fs');

let dataString = fs.readFileSync('./ansible/terraform-outputs.json');
let data = JSON.parse(dataString);
console.log(data);

fs.writeFileSync('./ansible/inventory.ini', data["content"]);
