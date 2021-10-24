output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.devtoolsCapstone.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.devtoolsCapstone.id
}

### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  server_name = "${var.host_label}"
  public_ip = "${aws_instance.devtoolsCapstone.public_ip}",
  instance_id = "${aws_instance.devtoolsCapstone.id}",
  instance_key_name = "${var.ssh_key_path}",
 }
 )
 filename = "../ansible/inventory.ini"
}
