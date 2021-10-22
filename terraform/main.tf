locals {
  myipv4 = "116.87.10.51"
}
resource "aws_security_group" "sg_22" {
  name   = "sg_22"
  vpc_id = data.aws_vpc.default_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${local.myipv4}/32"]
    # cidr_blocks = ["${chomp(data.http.myipv4.body)}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# resource "aws_key_pair" "ec2key" {
#   key_name = "james-macbook-id_rsa.pub"
#   public_key = "${file(var.public_key_path)}"
# }

resource "aws_instance" "devtoolsCapstone" {
  ami                    = "ami-0d058fe428540cd89"
  instance_type          = "t2.micro"

  # key_name = "${aws_key_pair.ec2key.key_name}"
  key_name = "james-sutd-ec2"
  vpc_security_group_ids = ["${aws_security_group.sg_22.id}"]

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'",
      # "sudo apt update",
      # "sudo apt upgrade -y"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file(var.ssh_key_path)}"
      host        = aws_instance.devtoolsCapstone.public_ip
    }
  }

  # provisioner "local-exec" {
  #   command = "ansible-playbook -i '${aws_instance.devtoolsCapstone.public_ip},' --private-key '${var.ssh_key_path}' docker.yaml"
  # }



  tags = {
    Name = "${var.host_label}"
  }
}

