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

This section will provide a simple description on each AWS resource used in this solution.

### Code organization

Code in this repository is organized as below,

```
|-- backend.tf
|-- ebs.tf
|-- instance.tf
|-- internetgateway.tf
|-- key.tf
|-- nat.tf
|-- providers.tf
|-- securitygroup.tf
|-- subnets.tf
|-- vars.tf
|-- vpc.tf
```

`backend.tf`: Configures the Terraform backend requires to store state remotely. In this case the backend is AWS S3.

`ebs.tf`: Declares the AWS EBS resource required to be provisioned to mount into the EC2 instances.

`instance.tf`: Declares the AWS EC2 instance required in the solution.

`internetgateway.tf`: Declares the internet gateway, the route table for public access, and routing rules for the public subnet.

`key.tf`: Declares the public key required to place in EC2 instance.

`nat.tf`: Declares the NAT gateway, the private route table, and routing rules for the private subnet.

`providers.tf`: Declares the AWS terrform provider.

`securitygroup.tf`: Declares the security group associated with the VPC to define ingress and egress.

`subnets.tf`: Declares the public and private subnets of the VPC.

`vars.tf`: Declares all the variables to be used by the infrastructure code.

`vpc.tf`: Declares the virtual private cloud.

### VPC

VPC simply stands for virtual private network. A VPC provides network level isolations to resources launched within it, which means all our resources will be located in our own network.

By deafult AWS will provide a default VPC for our use, but for small and medium use cases we can create our own VPC per region. Resources located in two VPCs can't communicate with each other using their private IP addresses. But it is possible to connect two VPCs and make that happen, which is referred as VPC peering.

### Internet Gateway

Internet gateway is the component in VPC that provides communication between the resources in VPC and the public internet. A typical internet gateway serves two purposes, it provides a target in VPC route tables for internet routable traffic, and provides network address translation for instances that have a public IP address assigned.

### NAT Gateway

NAT gateway is the component in VPC that enables instances in a private subnet to connect to the internet, or other AWS services, and prevent the internet origin connections reaching the private resources. The NAT gateway should always reside in a public subnet and a non changable elastic IP should be assigned to it.

### EC2 Instance

EC2 instances are the virtual machine instances. These can be launched in the default VPC or in a private VPC and attach it to a subnet.

### EBS Volume

EBS volumes stands for Elastic Block Storage. This provides the means of storage for the EC2 instances that we are provisioning. By default every EC2 instance will get a default EBS storage instance with 8 GB. These default EBS storage will be terminated when the EC2 instance is deprovisioning.

## Deployment

### Prerequisites

- AWS Cli
- Terraform
- Configure AWS cli. [Reference>>](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

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

Complete blog post is available in [here >>](https://isurusiri.medium.com/provision-an-ec2-instance-in-a-vpc-with-terraform-f5f6cdf53fe8)
