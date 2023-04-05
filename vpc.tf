resource "aws_vpc" "demo" {
  cidr_block       = "10.15.0.0/17"
  instance_tenancy = "default"

  tags = {
    Name = "RV_VPC_Terraform"
  }
}