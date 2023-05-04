# Hadoop Ecosystem Virtual Machine

## Introduction
If you're interested in learning about Big Data and Hadoop, the Cloudera Quickstart VM is a widely-used tool that you can download from this [link](https://www.oreilly.com/library/view/hands-on-big-data/9781788620901/e0c6657c-2989-4dc8-b2a6-56a9dd150b8d.xhtml). However, some people may find that their personal computer does not meet the minimum requirements to run the Cloudera Quickstart VM smoothly. Additionally, some people may not want to install VirtualBox on their computers. If you're facing any of these challenges, don't worry! There is an alternative solution.

You can use a virtual machine on a cloud provider to support the Cloudera Quickstart VM. In this repository, you'll find a terraform script to set up an EC2 Ubuntu instance (t3.xlarge = 4vCPU and 16GB of RAM) for this purpose. It's important to note that this type of EC2 instance isn't free of cost. However, the monthly cost will be minimal (each hour will cost around US$0.1664) if you use it for academic studies and responsible experimentation.

## Getting Started
1. Clone this repository to your local machine.
2. Fill the file `terraform.tfvars` with your AWS Security Credentials. If you're unsure how to do this, you can follow this guide: https://aws.amazon.com/blogs/security/how-to-find-update-access-keys-password-mfa-aws-management-console/.
3. Install Terraform on your computer. To do this, follow this guide: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli.

## Usage
1. To start your environment, run `bash turn_on_infra.sh` in the root directory of the project.
2. When you finish your experiments on Cloudera Quickstart VM, make sure to run `bash shutdown_infra.sh`. If you forget to do this, the EC2 instance will keep running and adding more costs to your AWS account.