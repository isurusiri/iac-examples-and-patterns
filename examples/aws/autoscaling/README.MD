# Autoscaling EC2 Instances

## Introduction   

Provisioning an EC2 instance may not be enough to handle dynamic performance needs. It is possible to increase the instance as required, however ideally this could have handled automatically. AWS EC2 Autoscaling fulfills this requirement. AWS Autoscaling allows us to automatically add or remove instances when certain thresholds are reached. There are two components that needs to be created in order to setup an autoscaling group in AWS,

- An AWS launch configuration: This is the component that defines AMIs and regions like configurations.
- An autoscaling group: This specifies the properties used to scale resources. For example the CPU threshold to be considered.
