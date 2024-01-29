import boto3
import pandas as pd

# Initialize an S3 client without providing AWS credentials for public bucket
s3_client = boto3.client('s3', region_name='us-east-1')

# Bucket name
s3_bucket_name = 'dmlab-datasets'


def get_dataset(csv_file):
    # Read the CSV file directly from S3 into a pandas DataFrame
    df = pd.read_csv(f's3://{s3_bucket_name}/{csv_file}.csv')

    # Return the DataFrame
    return df
