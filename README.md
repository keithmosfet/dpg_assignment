# Terraform AWS Infrastructure with Auto Scaling and Private/Public Subnets

This Terraform configuration sets up a scalable infrastructure on AWS, including a Virtual Private Cloud (VPC) with public and private subnets, EC2 instances deployed in private subnets, and a web server running on each instance displaying the instance's hostname. The setup includes AWS Auto Scaling Groups for dynamic scaling based on demand while maintaining security by keeping EC2 instances in private subnets.

## Prerequisites

1. **Terraform Installation**: Ensure Terraform is installed on your machine. You can download it from [terraform.io](https://www.terraform.io/downloads.html).

2. **AWS Credentials**: Configure your AWS credentials using the AWS CLI or environment variables.

## Usage

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/keithmosfet/dpg_assignment.git
   cd dpg_assignment


2. **Initialize Terraform:**

   ```bash
   terraform init

3. **Review Configuration:**

   ```bash
   terraform plan
Ensure there are no errors and review the planned changes.

4. **Apply Configuration:**

   ```bash
   terraform apply

Confirm the changes to provision the infrastructure.

5. **Access Web Application:**
   Once the infrastructure is provisioned, the web application is accessible via the Load Balancer's DNS name. The DNS name can be found in the Terraform output. It will look similar to the example below. Enter the DNS Name into your Web Browser.

   ```bash
   this_lb_dns_name = "dpg-dev-alb-1111111XXXXXXX.eu-central-1.elb.amazonaws.com"

NOTE: The Provisioning of the infrastructure may take some time even after terraform has completed :) please be patient

6. **Cleanup:**
At this point you should have seen the hostname within your web browser
   ```bash
   terraform destroy

# Configuration Details

## VPC Configuration:

- Public and private subnets across multiple availability zones.
- Internet Gateway for public subnet access.
- NAT Gateway for private subnet outbound traffic.

## Auto Scaling Configuration:

- Launch Configuration for EC2 instances.
- Auto Scaling Group for dynamic scaling based on demand.

## EC2 Configuration:

- Instances running a web server displaying the hostname.
- Security groups to control traffic.

## Load Balancer Configuration:

- Application Load Balancer to expose the web application.

## NAT Gateway:

- a NAT gateway is used so that instances in a private subnet can connect to services outside your VPC but external services cannot initiate a connection with those instances.




