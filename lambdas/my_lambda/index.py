import json
import boto3
import requests


def main(event, context):

    return {"statusCode": 200, "body": json.dumps("Hello from Lambda!")}
