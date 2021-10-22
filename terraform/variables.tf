variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_path" {
  description = "Private key path"
  default = "~/.ssh/james-sutd-ec2.pem"
}

variable "host_label" {
    default = "devtools-capstone"
}

data "http" "myipv4" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_vpc" "default_vpc" {
  default = true
}