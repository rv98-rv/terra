#Creating EC2 instance
resource "aws_instance" "ec21" {
  ami                    = "ami-07d3a50bd29811cd1" #ami id and instance type can get in aws instance launch page
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id] #passing security group as string
  key_name               = "terraform_key"            #Generated Key and stored it in local
  subnet_id              = aws_subnet.demo1.id        #Passing Subnet id to create instance on preferd subnet

  tags = {
    Name = "Terraform_Instance"
  }
}