output "notification_target_arn" {
  value = aws_sns_topic.topic.arn
}

output "role_arn" {
  value = aws_iam_role.notify_role.arn
}