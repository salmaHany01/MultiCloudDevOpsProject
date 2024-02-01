variable "vpc_id" {
  description = "VPC ID to attach the internet gateway"
}

variable "igwName" {
  description = "internet gateway name"
  type = string
  default = "final-proj-igw"
}