resource "aws_internet_gateway" "proj_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.igwName
  } 
}