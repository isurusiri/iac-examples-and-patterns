# Setting Up EC2 Instances in a VPC

## Introduction

Provisioning an EC2 instance in AWS is one of the simplest tasks. However, it is not be enough to have only an EC2 instance provisioned. It is required to limit access to the EC2 instance to provide network isolation while putting required routing mechanisms, and also there could be requirements to mount external storage volumes to the EC2 instance.

![Solution Overview](https://github.com/isurusiri/iac-examples-and-patterns/blob/main/examples/aws/ec2-in-a-vpc/misc/vpc-n-ec2.png?raw=true)

This sample code presentas Terraform code required to provision an EC2 instance inside a VPC. While doing do, it will,

- provision public and private subnet in three availability zones.
- expose the EC2 instance to the internet via an Internet Gateway.
- place required route associations in route tables.
- create a NAT gateway to allow internet access in private subnets.
- attach an EBS volument to the EC2 instance.

## Solution Overview

### Code organization

### VPC

### Internet Gateway

### NAT Gateway

### EC2 Instance

### EBS Volume

## Deployment

### Prerequisites

- AWS Cli
- Terraform
- Configure AWS clie. [Reference>>](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

First step of the deployment is to generate a ssh key pair,

```
$ ssh-keygen -t rsa
```

Verify and change the variables defined in the `vars.tf` or override them using a variable file with the name `terraform.tfvars`. Pay attention to the AWS region and the AMIs.

Initialize the providers,

```
$ terraform init
```

Verify the changes,

```
$ terraform plan
```

Provision the resources,

```
$ terraform apply
```

Once everything is done, don't forget to deprovision the resources,

```
$ terraform destroy
```
