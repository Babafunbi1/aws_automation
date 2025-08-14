resource "aws_sns_topic" "cpu_alerts" {
  name = "cpu-utilization-alerts"
}

resource "aws_sns_topic_subscription" "cpu_email_subscription" {
  topic_arn = aws_sns_topic.cpu_alerts.arn
  protocol  = "email"
  endpoint  = "babafunbio@gmail.com" 
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60 
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This metric triggers when CPU utilization exceeds 70%"
  alarm_actions       = [aws_sns_topic.cpu_alerts.arn]

  dimensions = {
    InstanceId = aws_instance.tf_test_instance.id 
  }
}

