# Hadoop Ecosystem Virtual Machine

## Introduction
If you're interested in learning about Big Data and Hadoop, the Cloudera Quickstart VM is a popular tool. However, some people may not be able to run the Cloudera Quickstart VM smoothly due to their computer not meeting the minimum requirements or not wanting to install VirtualBox. Don't worry! There is an alternative solution.

In this repository, you'll find a terraform script that can set up an EC2 Ubuntu instance on a cloud provider to support the Cloudera Quickstart VM. It's important to note that this EC2 instance isn't free of cost. However, the monthly cost will be minimal (around US$0.1664 per hour) if you use it for academic studies and responsible experimentation.

## Getting Started
1. Clone this repository to your local machine.
2. Fill the `terraform.tfvars` file with your AWS Security Credentials. If you're unsure how to do this, you can follow this guide: https://aws.amazon.com/blogs/security/how-to-find-update-access-keys-password-mfa-aws-management-console/.
3. Install Terraform on your computer by following this guide: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli.
4. Create a key pair for SSH on the EC2 instance. Follow these instructions: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/create-key-pairs.html. Make sure you create this key on the AWS Region us-east-2.
5. Fill the `ami_key_pair_name` variable in the `variable.tf` file with the name of the key pair you just created.

## Usage
1. To start your environment, run `bash turn_on_infra.sh` in the root directory of the project.
2. After you finish your experiments on Cloudera Quickstart VM, make sure to run `bash shutdown_infra.sh`. If you forget to do this, the EC2 instance will keep running and adding more costs to your AWS account.
3. To access your EC2 instance, find it on the AWS Console and follow the Connect instructions using SSH.