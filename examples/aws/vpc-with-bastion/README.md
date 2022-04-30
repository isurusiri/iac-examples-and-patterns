# VPC with Bastion Host

## Introduction

Bastion hosts provides secure access to EC2 instances placed in private and public subnets. VPC setup is no different from the usual and an internet gateway is placed in to allow access to the internet. This gateway is used by / associated with the bastion instance to send and receive traffic. Instances in private subnet will gain access to internet using the NAT gateway and bastion will allow access to the internet over SSH. In addition, the bastion host will have a public Elastic IP.
