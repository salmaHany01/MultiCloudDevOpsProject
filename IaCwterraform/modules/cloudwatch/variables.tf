variable "instance_id" {
  description = "The EC2 instance ID for the CloudWatch Alarm."
}

variable "alarm_name" {
  description = "The descriptive name for the CloudWatch Alarm."
  default     = "ec2-cpu-high"
}

variable "alarm_description" {
  description = "The description for the CloudWatch Alarm."
  default     = "This metric monitors EC2 CPU utilization"
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic for notifications"
  type        = string
}