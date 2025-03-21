# 0rdinary J0e's Extra0rdinary Prints


<B>Table of Contents</B>
- Introduction
- Features
- Technologies Used
- Architecture Diagram
- Website Example
- Setup and Installation


**Introduction**
This project was primarilly a AWS 3-tiered architecture project, deploying in Dev,UAT,Prod, and focusing on hands on core AWS features, as well as Infrastructure as Code using Terraform. Deploy a scalable AWS infrastructure using Terraform for Dev, UAT, and Prod environments. Each environment has specific AWS resources that align with its purpose.

### Dev
- **AWS Elastic File System (EFS)**: Shared file storage for EC2 instances.
- **AWS CloudWatch Logs**: Centralized logging and monitoring.

### UAT
- **Amazon ElastiCache (Redis)**: Caching to improve performance.
- **AWS Step Functions**: Orchestration of automated workflows for testing.

### Prod
- **AWS App Mesh**: Service mesh for microservice networking.
- **AWS Athena**: Query service for analytics on S3 data.
- **AWS WAF**: Web Application Firewall for enhanced security.

### Common Resources
- **EC2 Instances** (multiple AZ and Auto Scaling to host services)
- **EBS Volumes**
- **Security Groups**
- **VPC**, Subnets, Route Tables, and Gateways
- **IAM Roles/Policies**

---------------------------------------------------------------------------------------------------------------------------------------------------------

***The Company/Product Objective***

0rdinary J0e's Extra0rdinary Prints is a 3D Printing service where customers can upload models to be printed, and shipped to the intended end user. The UI still needs to be developed, but should allow intuitive navigation for those without printing expreience to produce quality products.


**Features for Website** <-- Not included in code as of yet
- User Accounts: Register and log in to the platform.
- Uploading Models: Upload models to be printed.
- Shopping Cart: Display what models have been ordered and options selected.

**Technologies To Be Used**
- Frontend: HTML, CSS, JavaScript (or whatever you want to use)
- Backend: Node.js, Python, or other technologies depending on your stack.
- Database: AWS DynamoDB, MySQL, or any database technology used.
- Infrastructure: AWS services (like EC2, S3, Lambda), Terraform for Infrastructure as Code. Cloudfront (streaming, downloading)
- Version Control: Git & GitHub.


### Architecture Diagram

![Architecture Diagram Thumbnail](https://github.com/0rdinary-J0e/0rdinary_Terraform/blob/master/0rdinaryJ0e'sExtra0rdinaryPrints_Diagram.png)


---------------------------------------------------------------------------------------------------------------------------
**Setup and Installation**

Follow these steps to deploy these terraform files/resources in AWS:

**Prerequisites**
- AWS CLI: Configured with your AWS credentials (aws configure).
- Terraform: Installed on your machine.
- Git: Installed for cloning the repo.
- VSCode: Installed, with the terminal ready to use.
- Some items need pre-set-up in AWS (AWS buckets, Lambda Bucket & Function, some thought on subnets and variables)

**Instalation Steps**
     
     1) Clone the Repo
           git clone https://github.com/0rdinary-J0e/0rdinary_Terraform
     2) Initialize Terraform
           terraform init
     3) Validate the Terraform files (optional but recommended)
           terraform validate
     4) Preview the execution plan
           terraform plan
     5) Apply the Terraform configuration to deploy resources
           terraform apply

This process will deploy the resources (EC2, EFS, VPC components, etc.) across Dev, UAT, and Prod environments, based on the files in each corresponding directory.

-----------------------------------------------------------------------------------------------------------------------------------------------------
**License**
MIT License

Copyright (c) 2025 Joseph Sweeney

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
