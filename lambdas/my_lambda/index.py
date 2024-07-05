import json
import boto3
import time


def main(event, context):
    start_time = time.time()  # 获取开始时间

    result = "Hello from Lambda!"

    http_method = event["httpMethod"]

    client_body = event["body"]
    if client_body and http_method:
        result = "{}({})".format(client_body, http_method)
    else:
        result = "No body({})".format(http_method)

    end_time = time.time()  # 获取结束时间
    execution_time = "(程序运行时间：%.2f 秒)" % (
        end_time - start_time
    )  # 计算程序运行时间
    print(execution_time)

    return {
        "statusCode": 200,
        "body": "{}\n\n{}".format(execution_time, result),
        "headers": {"Content-Type": "text/plain"},
    }
