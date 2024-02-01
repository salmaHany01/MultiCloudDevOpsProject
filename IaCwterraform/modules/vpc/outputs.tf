output "vpc_id" {
  description = "Created VPC id"
  value       = aws_vpc.final_proj_vpc.id
}

output "vpc_cidr_block" {
  description = "Created VPC CIDR block"
  value       = aws_vpc.final_proj_vpc.cidr_block
}

