# Enable AWS Config for compliance recording
resource "aws_config_configuration_recorder" "scout" {
  name     = "cloud-scout-recorder"
  role_arn = aws_iam_role.config_role.arn
}

# CIS Benchmark Rules (Example: Check for unencrypted S3 buckets)
resource "aws_config_config_rule" "s3_encryption_rule" {
  name = "s3-bucket-server-side-encryption-enabled"
  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }
}
resource "aws_config_configuration_recorder" "scout" {
  name     = "cloud-scout-recorder"
  role_arn = aws_iam_role.config_role.arn
}

resource "aws_iam_role" "config_role" {
  name        = "CloudConfigRole"
  description = "Role for AWS Config"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "config_policy" {
  name       = "config-readonly"
  roles      = [aws_iam_role.config_role.name]
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_config_config_rule" "s3_encryption_rule" {
  name = "s3-bucket-server-side-encryption-enabled"
  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }
}

resource "aws_iam_role" "scout_role" {
  name        = "CloudSecurityScoutRole"
  description = "Role for Cloud Security Scout"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "scout_policy" {
  name       = "scout-readonly"
  roles      = [aws_iam_role.scout_role.name]
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
resource "aws_config_configuration_recorder" "scout" {
  name     = "cloud-scout-recorder"
  role_arn = aws_iam_role.config_role.arn
}

resource "aws_config_config_rule" "s3_encryption_rule" {
  name = "s3-bucket-server-side-encryption-enabled"
  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_SERVER_SIDE_ENCRYPTION_ENABLED"
  }
}

resource "aws_iam_role" "config_role" {
  name        = "CloudConfigRole"
  description = "Role for AWS Config"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "config_policy" {
  name       = "config-readonly"
  roles      = [aws_iam_role.config_role.name]
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}

resource "aws_iam_role" "scout_role" {
  name        = "CloudSecurityScoutRole"
  description = "Role for Cloud Security Scout"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "scout_policy" {
  name       = "scout-readonly"
  roles      = [aws_iam_role.scout_role.name]
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
# IAM Role for read-only scanning
resource "aws_iam_role" "scout_role" {
  name = "CloudSecurityScoutRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "scout_policy" {
  name       = "scout-readonly"
  roles      = [aws_iam_role.scout_role.name]
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}