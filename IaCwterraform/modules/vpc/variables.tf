variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}
variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "final-project-vpc"
}

