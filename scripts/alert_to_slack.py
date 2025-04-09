import requests
import json

def send_slack_alert(message):
    webhook_url = os.getenv('SLACK_WEBHOOK')
    payload = {
        "text": f"🚨 Cloud Security Alert: {message}",
        "blocks": [
            {
                "type": "section",
                "text": {
                    "type": "mrkdwn",
                    "text": f"*Security Misconfiguration Detected*\n{message}"
                }
            }
        ]
    }
    requests.post(webhook_url, json=payload)