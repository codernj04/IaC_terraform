terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "Terraform-Demo-Server"
    Environment = "Internship"
  }
}
