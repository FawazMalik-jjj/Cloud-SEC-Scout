# ☁️ Cloud Security Scout  
**Automated AWS/GCP/Azure Compliance Scanner | Terraform + ScoutSuite + CI/CD**

[![AWS](https://img.shields.io/badge/AWS-Config-FF9900?logo=amazon-aws)](https://aws.amazon.com/config/)
[![ScoutSuite](https://img.shields.io/badge/ScoutSuite-5.0+-blue)](https://github.com/nccgroup/ScoutSuite)
[![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-Daily_Scans-2088FF?logo=github-actions)](https://github.com/features/actions)

![Cloud Security Dashboard](docs/dashboard.png)

## 🔍 Key Features
- **200+ Prebuilt Checks** for CIS, NIST, PCI-DSS
- **Auto-Remediation Scripts** for common misconfigurations
- **Slack/Teams Alerts** for critical findings
- **Compliance Dashboard** with historical trends

## 🛠️ Tech Stack
| Component       | Tools Used                          |
|-----------------|-------------------------------------|
| Infrastructure  | Terraform, AWS Config               |
| Scanner Engine  | ScoutSuite, Boto3, Custom SQL Rules|
| CI/CD           | GitHub Actions, AWS CodePipeline    |
| Visualization   | Streamlit, AWS QuickSight           |

## 📊 Sample Report Output
```sql
SELECT resource_id, severity 
FROM aws_security_findings 
WHERE status = 'FAILED' 
ORDER BY severity DESC
