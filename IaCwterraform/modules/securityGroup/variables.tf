variable "vpc_id" {}
variable "subnet_id" {}
variable "security_group_name" {
  description = "security group name"
  type        = string
  default     = "final-project-sg"
}

