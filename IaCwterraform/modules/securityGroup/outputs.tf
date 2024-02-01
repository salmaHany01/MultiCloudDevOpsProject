output "security_group_id" {
  description = "Created security group id"
  value       = aws_security_group.proj_sg.id
}
