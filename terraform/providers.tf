terraform {
  # required_version = "= 1.0.5"
  required_version = "~> 0.15"

  backend "remote" {
    organization = "james-sutd"

    workspaces {
      name = "devtools-hw-day4"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}

