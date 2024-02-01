resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = var.alarm_description

  dimensions = {
    InstanceId = var.instance_id
  }

  actions_enabled = false
  alarm_actions = [var.sns_topic_arn]
}