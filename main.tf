provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-east-2"
}

data "aws_vpc" "default_region_vpc" {
  default = true
}

data "aws_subnets" "test_subnet_ids" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default_region_vpc.id]
  }
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  tags = {
    projeto = "hadoop_ecosystem"
    life_cycle = "efemero"
  }
}

resource "aws_security_group" "security_group_haddop_ecosystem"{
    name = "hadoop_ecosystem_sg"
    description = "Grupo de seguranca para a VM com o ecossistema haddop"
    vpc_id = data.aws_vpc.default_region_vpc.id

    ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
    }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
    tags=local.tags
}



resource "aws_instance" "hadoop_ecosystem_ec2" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = data.aws_subnets.test_subnet_ids.ids[0]
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
    vpc_security_group_ids = [aws_security_group.security_group_haddop_ecosystem.id]
    user_data = "${file("./bootstrap.sh")}"
    ebs_block_device {
        device_name           = "/dev/sda1"
        volume_size           = "30"
        volume_type           = "gp2"
        encrypted             = false
        delete_on_termination = true
    }
    tags = local.tags
}