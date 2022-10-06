terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"
    }
  }
}


# Use shared credentials file method (METHOD-1) to declare provider instead of hardcoding your key details like METHOD-2.


# Method-1

provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]  # path to credentials file
  profile                  = "vscode"                # name of the programatic user created beforehand 
  region                   = var.region
}

# Method-2
# provider "aws" {
#   region     = var.region
#   access_key = "my-access-key" #type your key
#   secret_key = "my-secret-key" ##type your secret-key
# }

# Provide a static IP address to the Lightsail instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  instance_name = aws_lightsail_instance.instance.name
  static_ip_name = var.static_ip_attachment
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = var.static_ip
}

# Create a new Lightsail SSH Key Pair
resource "aws_lightsail_key_pair" "intance_key_pair" {
  name = var.intance_key_pair
}

# Create a new Wordpress Lightsail Instance
resource "aws_lightsail_instance" "instance" {
  name              = var.instance
  availability_zone = var.instance_availability_zone
  blueprint_id      = var.instance_blueprintid
  bundle_id         = var.instance_bundleid
  key_pair_name     = var.intance_key_pair
  tags = {
    Environment = "Development"
  }
}





