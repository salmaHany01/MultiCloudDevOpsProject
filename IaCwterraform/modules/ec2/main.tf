resource "aws_instance" "my_ec2_instance" {
  ami             = var.ec2Ami
  instance_type   = var.ec2InstanceType
  subnet_id       = var.subnetID
  security_groups = var.ec2SecurityGroup

  tags = {
    Name = var.ec2InstanceName
  }	
}