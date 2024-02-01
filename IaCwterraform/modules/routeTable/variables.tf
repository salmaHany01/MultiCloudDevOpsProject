variable "vpc_id" {
  description = "VPC ID for the route table"
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID to create routes"
}

variable "routeName" {
  description = "route table name"
  type = string
  default = "final-proj-route-table"
}

variable "subnet_id" {}
variable "route_table_id" {}
