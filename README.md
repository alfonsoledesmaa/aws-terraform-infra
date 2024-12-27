# AWS Terraform Infrastructure

This Terraform project provisions an AWS infrastructure for managing VPC, subnets, an Elastic Load Balancer (ELB), and Route 53 DNS records. The project is structured into modules for better organization, with separate modules for networking, load balancing, and DNS. The state is stored in an S3 bucket with state locking using DynamoDB.

## Prerequisites

- AWS Account and AWS CLI configured.
- Terraform v0.13 or later installed.
- IAM User with required permissions to manage AWS resources.

## Directory Structure

````
.
├── scripts/                 # Scripts directory for part II
│   ├── list_aws_resources.py# Script that lists AWS Resources on each service declared.
├── backend.tf               # Terraform backend configuration (S3 + DynamoDB)
├── providers.tf             # AWS provider configuration
├── variables.tf             # Variable definitions for the project
├── outputs.tf               # Outputs for the Terraform configuration
├── main.tf                  # Root Terraform configuration calling the modules
├── .gitignore               # Git ignore file to exclude unnecessary files
├── modules/
│   ├── network/             # Network-related resources (VPC, subnets, security groups)
│   │   ├── main.tf          # Network resources
│   │   ├── variables.tf     # Variables for the network module
│   │   └── outputs.tf       # Outputs for the network module
│   ├── load_balancer/       # Load balancer configuration (ELB)
│   │   ├── main.tf          # Load balancer resources
│   │   ├── variables.tf     # Variables for the load balancer module
│   │   └── outputs.tf       # Outputs for the load balancer module
│   └── dns/                 # DNS configuration (Route 53)
│       ├── main.tf          # DNS resources (Hosted zone, records)
│       ├── variables.tf     # Variables for DNS configuration
│       └── outputs.tf       # Outputs for DNS configuration
└── .terraform/              # Terraform working directory (should be ignored by git)

````

## Modules

### 1.- Network Module

The Network module manages all network-related resources, including the creation of the VPC, subnets (public and private), security groups, and internet gateway.

#### Resources:
 - **aws_vpc**: Creates a virtual private cloud (VPC) with DNS support and hostname resolution.
 - **aws_subnet**: Creates public and private subnets in multiple availability zones.
 - **aws_security_group**: Defines a security group allowing inbound HTTP and HTTPS traffic.

#### Variables:
- **vpc_cidr**: CIDR block for the VPC.
- **public_subnet_1_cidr**: CIDR block for the first public subnet.
- **public_subnet_2_cidr**: CIDR block for the second public subnet.
- **private_subnet_1_cidr**: CIDR block for the first private subnet.
- **private_subnet_2_cidr**: CIDR block for the second private subnet.
- **az_1**: Availability zone for the first subnet.
- **az_2**: Availability zone for the second subnet.

#### Outputs
- **vpc_id**: ID of the created VPC.
- **public_subnet_1_id**: ID of the first public subnet.
- **public_subnet_2_id**: ID of the second public subnet.
- **security_group_id**: ID of the security group.

### 2.- Load Balancer Module

The Load Balancer module manages the Elastic Load Balancer (ELB) and its listeners for HTTP and HTTPS traffic.

#### Resources:
- aws_lb: Creates an Application Load Balancer.
- aws_lb_listener: Creates listeners for HTTP (port 80) and HTTPS (port 443) with SSL termination.

#### Variables:

- **security_group_ids**: List of security group IDs to associate with the load balancer.
- **subnet_ids**: List of subnet IDs where the load balancer will be deployed.
- **ssl_certificate_arn**: ARN of the SSL certificate for the HTTPS listener.

#### Outputs
- **elb_dns_name**: DNS name of the created ELB.

### 3.- DNS Module

The DNS module manages Route 53 hosted zones and records, allowing you to point your domain to the load balancer.

#### Resources:
- **aws_route53_zone**: Creates a Route 53 hosted zone for your domain.
- **aws_route53_record**: Creates a CNAME record pointing to the load balancer.

#### Variables:
- **domain_name**: The domain name for the Route 53 hosted zone.
- **elb_dns_name**: DNS name of the load balancer.

## Backend Configuration

The backend configuration is set to use an S3 bucket for storing the Terraform state files. State locking is enabled using DynamoDB to prevent concurrent modifications to the state.

- S3 bucket: Used to store the Terraform state.
- DynamoDB table: Used for state locking.

## Setting Up the Project

### 1.- Initialize project
To initialize the Terraform environment and download the necessary provider plugins, run the following command:

````bash
terraform init
````
This will initialize the backend and configure the provider.

### 2.- Apply Terraform Configuration

After initializing the Terraform environment, you can apply the configuration to create the infrastructure:

````bash
terraform apply
````
Terraform will show a plan of the changes it will make. Review the plan, and type yes to proceed.
