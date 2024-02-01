output "ec2_instance_id" {
  description = "Created EC2 instance id"
  value       = aws_instance.my_ec2_instance.id
}


