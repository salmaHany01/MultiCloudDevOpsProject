resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "us-east-1a" 
  map_public_ip_on_launch = true

  tags = {
   Name = var.public_subnet_name
   }
}

