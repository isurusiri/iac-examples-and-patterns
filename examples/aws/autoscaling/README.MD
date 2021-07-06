# Autoscaling EC2 Instances

## Introduction   

Provisioning an EC2 instance may not be enough to handle dynamic performance needs. It is possible to increase the instance as required, however ideally this could have handled automatically. AWS EC2 Autoscaling fulfills this requirement. AWS Autoscaling allows us to automatically add or remove instances when certain thresholds are reached. There are two components that needs to be created in order to setup an autoscaling group in AWS,

- An AWS launch configuration: This is the component that defines AMIs and regions like configurations.
- An autoscaling group: This specifies the properties used to scale resources. For example the CPU threshold to be considered.

This repository presents Terraform code required to provision EC2 instances with AWS autoscaling. While doing it, it will,

- Provision three public and private subnets in three availability zones.
- Expose the EC2 instances to the internet via an Internet Gateway.
- Place required routing associations in route tables.
- Define AWS launch configuration to provision EC2 instnces.
- Define an autoscaling group to manage EC2 instances via the AWS launch configuration.

## Solution Overview

This section provides a simple description on each AWS resource used in this solution.

### Code Organization

Code in this repository is organized as below,

```
|-- autoscaling.tf
|-- autoscalingpolicy.tf
|-- backend.tf
|-- internetgateway.tf
|-- key.tf
|-- provider.tf
|-- securitygroup.tf
|-- subnets.tf
|-- vars.tf
|-- versions.tf
|-- vpc.tf
```