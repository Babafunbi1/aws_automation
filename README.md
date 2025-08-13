# AWS Infrastructure Deployment with Terraform

This Terraform project creates the following AWS resources:

- **EC2 Instance**
- **IAM User** with:
  - Full access to EC2
  - Read-only access to S3 buckets
- **VPC** with two subnets in `us-east-1a` and `us-east-1b`
- **Internet Gateway** allowing internet access from both subnets
- **RDS PostgreSQL Database** with a subnet group spanning both subnets
- **Public S3 Bucket** configured as a static website

---

## Resources Description

### 1. VPC and Networking

- **VPC:**  
  Created with CIDR block `10.1.0.0/16`.
  
- **Subnets:**  
  Two subnets are created:
  - Subnet 1: `10.1.1.0/24` in availability zone `us-east-1a`
  - Subnet 2: `10.1.2.0/24` in availability zone `us-east-1b`

- **Internet Gateway:**  
  Attached to the VPC and associated with a route table to provide internet access to both subnets.

---

### 2. IAM User and Policies

- **IAM User:**  
  Created with:
  - Full EC2 access (`AmazonEC2FullAccess`)
  - Read-only access to all S3 buckets (`AmazonS3ReadOnlyAccess`)

---

### 3. EC2 Instance

- Created inside the VPC using one of the created subnets.
- Uses the default security group or a custom security group that allows necessary inbound/outbound traffic.

---

### 4. RDS PostgreSQL Database

- PostgreSQL database instance created inside the VPC.
- Uses a **DB subnet group** containing both subnets for high availability.
- Configured to be publicly accessible.
- Associated with a security group that allows PostgreSQL traffic (port 5432).

---

### 5. S3 Bucket for Static Website

- Publicly accessible S3 bucket.
- Configured with website hosting enabled.
- Bucket policy allows public read access.

---

## How to Use

1. **Clone this repository:**

   ```bash
   git clone https://github.com/your-repo/aws-terraform-project.git
   cd aws-terraform-project
