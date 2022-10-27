terraform {
  required_providers {
    # contains terraform settings, including the required providers Terraform will use to provision infrastructure
    aws = {
      source = "hashicorp/aws"
      # source is the global source address
      # source defines an optional hostname, namespace, provider type
      # providers are installed from the Terraform Registry by default
      # hashicorp/aws is shorthand for registry.terraform.io/hashicorp/aws
      version = "~> 4.16"
      # version is optional but recommended
    }
  }
  cloud {
    organization = "github-auto-deploy"

    workspaces {
      name = "gh-actions-demo"
    }

  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  # provider block configures the specified provider
  # a provider is a plugin Terraform uses to create and manage your resources
  region = "us-east-2"
}

# resource "aws_instance" "tf_created_instance" {
#   # a resource might be physical or virtual component or a logical resource
#   # a resource has two strings before the block: resource type and resource name
#   #   resource type prefix maps to the name of the provider
#   #   the resource type and name together form a unique ID for the resource
#   ami           = "ami-089a545a9ed9893b6"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Instance created by Terraform"
#   }
# }

module "ec2_created_by_local_module" {
  source = "./modules"
}

module "ec2_created_by_terraform_provided_module" {
  source = "terraform-aws-modules/ec2-instance/aws"
#TODO need to determine the minimum required attributes
  ami = "ami-089a545a9ed9893b6"
  tags = {
    Name = "Created by Terraform Provided Module"
  }
}