
provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "my_ec2_terraform" {
  ami           = "ami-0715c1897453cabd1"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2_terraform"
  }
}

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "PUT-YOUR-GITHUB-TOKEN-HERE"
}

resource "github_repository" "terraform" {
  name        = "terraform"
  description = "Deploying an EC2 Instance and Creating A Github Repo"
  visibility = "public"

}
