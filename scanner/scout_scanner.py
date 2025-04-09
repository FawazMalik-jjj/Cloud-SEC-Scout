import boto3
from scoutsuite.core.providers.aws.facade.utils import get_aws_account_id
from scoutsuite import ScoutSuite

def run_scan():
    # Authenticate using IAM role
    session = boto3.Session()
    account_id = get_aws_account_id(session)
    
    # Run ScoutSuite scan
    report = ScoutSuite(
        provider='aws',
        report_dir=f"./reports/{account_id}",
        aws_access_key_id=session.get_credentials().access_key,
        aws_secret_access_key=session.get_credentials().secret_key,
        aws_session_token=session.get_credentials().token,
        aws_account_id=account_id
    )
    
    # Generate HTML report
    report.run(programmatic=True)
    
if __name__ == "__main__":
    run_scan()