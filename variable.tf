variable "aws_access_key" {
    description = "Access key to AWS Console"
}

variable "aws_secret_key" {
    description = "Secret Key to AWS Console"
}

variable "instance_name" {
    description = "Name of the instance to be created"
    default = "hadoop_ecosystem_cloudera"
  
}

variable "instance_type" {
    description = "Type of instance to be created"
    default = "t3.xlarge"
  
}

variable "ami_id" {
    description = "The image to use"
    default = "ami-0a695f0d95cefc163"
  
}

variable "number_of_instances" {
    description = "number of instances (VMs) to be created"
    default = 1 
}

variable "ami_key_pair_name" {
    default = "hadoop_ecosystem"
  
}