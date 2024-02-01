variable "vpc_id" {}

variable "public_subnet_cidr" {
  description = "public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}
variable "public_subnet_name" {
  description = "public subnet name"
  type        = string
  default     = "final-project-public-subnet"
}
