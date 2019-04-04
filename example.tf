provider "aws" {
    access_key = "AKIAI4BDFALLQVZGBOUA"
    secret_key = "Q/mTCVU1kjEaDB7XIpbtWKEQlfIuGrQcZJSQFQRT"
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-0803e5807bcca88c8"
    instance_type = "t2.micro"
    tags = {
        Name = "SecurityGroupTest"
    }
}
resource "aws_security_group" "allow_tls" {
  name        = "tester"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-913abdeb"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}