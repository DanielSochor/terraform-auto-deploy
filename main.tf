terraform {
  required_providers {
    # contains terraform settings, including the required providers Terraform will use to provision infrastructure
    aws = {
      source  = "hashicorp/aws"
    # source is the global source address
    # source defines an optional hostname, namespace, provider type
    # providers are installed from the Terraform Registry by default
    # hashicorp/aws is shorthand for registty.terraform.io/hashicorp/aws
      version = "~> 4.16"
    # version is optional but recommended
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-089a545a9ed9893b6"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

cloud {
    organization = "github-auto-deploy"

    workspaces {
        name = "gh-actions-demo"
    }
}
