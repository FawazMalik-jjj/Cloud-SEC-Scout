CHECKS = [
    {
        "id": "CIS-1.3",
        "title": "Ensure no S3 buckets are publicly accessible",
        "query": """
            SELECT arn 
            FROM aws_s3_buckets 
            WHERE block_public_acls = FALSE 
            OR block_public_policy = FALSE 
            OR ignore_public_acls = FALSE 
            OR restrict_public_buckets = FALSE
        """,
        "severity": "CRITICAL"
    },
    {
        "id": "CIS-2.1",
        "title": "Ensure MFA is enabled for all IAM users",
        "query": "SELECT arn FROM aws_iam_users WHERE mfa_active = FALSE",
        "severity": "HIGH"
    }
]