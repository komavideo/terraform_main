import json
import boto3
import requests


def main(event, context):

    client_body = event["body"]
    if client_body:
        print(client_body)
    else:
        print("No body")

    return {
        "statusCode": 200,
        "body": json.dumps("Hello from Lambda!"),
        "headers": {"Content-Type": "text/plain"},
    }
