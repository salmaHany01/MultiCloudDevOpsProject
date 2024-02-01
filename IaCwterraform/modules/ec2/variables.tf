variable "ec2InstanceType" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
#"ami-0a3c3a20c09d6f377"
variable "ec2Ami" {
  description = "EC2 instance AMI ID"
  type        = string
  default     = "ami-0a3c3a20c09d6f377"	
}

variable "ec2InstanceName" {
  description = "EC2 instance name"
  type        = string
  default     = "FinalProjectEC2"
}
 
variable "subnetID" {}

variable "ec2SecurityGroup" {
  description = "EC2 instance security group"
  type = list(string)
}
