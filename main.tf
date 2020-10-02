
resource "aws_sns_topic" "topic" {
  name         = var.topic_name
  display_name = var.topic_name
}

resource "aws_iam_role" "notify_role" {
  name = var.sns_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "notify_sns_access" {
  role       = aws_iam_role.notify_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AutoScalingNotificationAccessRole"
}