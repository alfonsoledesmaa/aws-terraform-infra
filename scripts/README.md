# AWS Resource Lister Documentation

The AWS Resource Lister is a Python script that provides a simple way to list AWS resources across all regions in your AWS account. It currently supports listing EC2 instances, RDS databases, and Lambda functions.

## Prerequisites

- Python 3.8 or higher
- boto3 library (pip install boto3)
- Configured AWS credentials with appropriate permissions

## AWS Permissions Required
The script requires at least the following AWS IAM permissions:

````json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeRegions",
                "ec2:DescribeInstances",
                "rds:DescribeDBInstances",
                "lambda:ListFunctions"
            ],
            "Resource": "*"
        }
    ]
}
````

## Usage

### 1.- Install dependencies
````bash
pip install boto3
````

### 2.- Configure AWS credentials using one of:
- AWS CLI `aws configure`
- Env variables
````bash
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
````

### 3.- Run the script
````bash
python aws_resources.py
````

## Adding new services to the script

### Step 1: Add the boto3 client
Add your new service client in the main function:

````python
# Add this with other clients
new_service = boto3.client('service-name', region_name=region)
````

### Step 2: Add the listing logic
Add the service listing code in the try blocks. i.e.

````python
# Add inside try block
print("\nECS Clusters:")
ecs = boto3.client('ecs', region_name=region)
clusters = ecs.list_clusters()
for cluster_arn in clusters['clusterArns']:
    print(f"  Cluster ARN: {cluster_arn}")
````