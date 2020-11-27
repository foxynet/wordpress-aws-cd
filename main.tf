terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "wordpress-aws-cd"
    workspaces {
      name = "wordpress-aws-cd"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.small"
  subnet_id     = "subnet-04863b61"
  
}
