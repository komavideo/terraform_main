import json
import boto3
import requests


def main(event, context):

    result = "Hello from Lambda!"

    http_method = event["httpMethod"]

    client_body = event["body"]
    if client_body and http_method:
        result = "{}({})".format(client_body, http_method)
    else:
        result = "No body({})".format(http_method)

    return {
        "statusCode": 200,
        "body": result,
        "headers": {"Content-Type": "text/plain"},
    }
