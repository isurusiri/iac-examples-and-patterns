# EC2 Roles and Instance Profiles

## Introduction

It is possible that there could be situations where a service running on EC2 instance or the instance itself might need to access a perticular AWS service. However, keeping / sharing AWS credentials with an EC2 instance is a recipe for disaster. In such situations IAM roles are used to grant the application or EC2 instance access to AWS services without using permanent credentials. Once an IAM role is attached to an EC2 instance, it can access all AWS services granted permission in the IAM policy attached with the IAM role.

![Solution Overview](https://github.com/isurusiri/iac-examples-and-patterns/blob/main/examples/aws/ec2-roles-and-instance-profiles/misc/instance_profile.png?raw=true)   

This sample code presentas Terraform code required to provision an EC2 instance inside and access S3 bucket using the temporary credentials obtained using an instance profile. This includes,   
- provision public network setup that includes a subnet, security group, internet gateway in a VPC.
- S3 bucket to accessed by the EC2 instance.
- IAM role and a policy to attach to the EC2 instance.
- Instance profile that attach the IAM role with the EC2 instance.   

## Code organization   

Code in this repository is organized as below,
```
|-- backend.tf
|-- ec2.tf
|-- iam_instance_profile.tf
|-- iam_policy.tf
|-- iam_role.tf
|-- internetgateway.tf
|-- key.tf
|-- providers.tf
|-- README.md
|-- s3.tf
|-- securitygroup.tf
|-- subnets.tf
|-- vars.tf
|-- versions.tf
|-- vpc.tf
```

`backend.tf`: Configures the Terraform backend requires to store state remotely. In this case the backend is AWS S3.   

`ec2.tf`: Declares the AWS EC2 instance required in the solution.   

`internetgateway.tf`: Declares the internet gateway, the route table for public access, and routing rules for the public subnet.   

`iam_instance_profile.tf`: Defines the instance profile for the EC2 instance.   

`iam_policy.tf`: IAM policy for getting and listing S3 objects from the EC2 instance.   

`iam_role.tf`: Defines the IAM role and attaches the IAM policy with it.

`key.tf`: Declares the public key required to place in EC2 instance.   

`providers.tf`: Declares the AWS terrform provider.   

`securitygroup.tf`: Declares the security group associated with the VPC to define ingress and egress.

`subnets.tf`: Declares the public and private subnets of the VPC.

`vars.tf`: Declares all the variables to be used by the infrastructure code.

`vpc.tf`: Declares the virtual private cloud.

## Solution Overview   

This section provides a simple description on each important AWS resource specific in this solution.   

### IAM Role   

Similar to IAM users, IAM role is an identity that defintes specific permissions. The permission policy of an IAM role determines what can and cannot do by the identity. 