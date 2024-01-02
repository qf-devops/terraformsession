import gzip
import json
import base64
def lambda_handler(event, context):
    print(f'Logging Event: {event}')
    print(f"Awslog: {event['awslogs']}")
    cw_data = event['awslogs']['data']
    print(f'data: {cw_data}')
    print(f'type: {type(cw_data)}')
    compressed_payload = base64.b64decode(cw_data)
    uncompressed_payload = gzip.decompress(compressed_payload)
    payload = json.loads(uncompressed_payload)

    log_events = payload['logEvents']
    for log_event in log_events:
        print(f'LogEvent: {log_event}')
    return {
        'statusCode': 200,
        'body': 'Hello from Lambda!'
    }
