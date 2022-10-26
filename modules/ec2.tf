resource "aws_instance" "tf_created_instance" {
  # a resource might be physical or virtual component or a logical resource
  # a resource has two strings before the block: resource type and resource name
  #   resource type prefix maps to the name of the provider
  #   the resource type and name together form a unique ID for the resource
  ami           = "ami-089a545a9ed9893b6"
  instance_type = "t2.micro"

  tags = {
    Name = "Created by Terraform Local Module"
  }
}