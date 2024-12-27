import boto3

def list_resources():
    # Get list of all regions
    ec2 = boto3.client('ec2', region_name='us-east-1')
    regions = [region['RegionName'] for region in ec2.describe_regions()['Regions']]

    for region in regions:
        print(f"\n=== Region: {region} ===")
        
        # Create boto3 clients
        ec2 = boto3.client('ec2', region_name=region)
        rds = boto3.client('rds', region_name=region)
        lambda_client = boto3.client('lambda', region_name=region)
        
        try:
            # List EC2 instances
            print("\nEC2 Instances:")
            instances = ec2.describe_instances()
            for reservation in instances['Reservations']:
                for instance in reservation['Instances']:
                    print(f"  ID: {instance['InstanceId']}, Type: {instance['InstanceType']}, State: {instance['State']['Name']}")

            # List RDS instances
            print("\nRDS Instances:")
            dbs = rds.describe_db_instances()
            for db in dbs['DBInstances']:
                print(f"  ID: {db['DBInstanceIdentifier']}, Engine: {db['Engine']}, Status: {db['DBInstanceStatus']}")

            # List Lambda functions
            print("\nLambda Functions:")
            functions = lambda_client.list_functions()
            for func in functions['Functions']:
                print(f"  Name: {func['FunctionName']}, Runtime: {func['Runtime']}")

        except Exception as e:
            print(f"Error in region {region}: {str(e)}")

if __name__ == "__main__":
    list_resources()