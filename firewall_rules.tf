# firewall_rules.tf

# Security group for inbound rules
resource "aws_security_group" "inbound_sg" {
  name        = "InboundSecurityGroup"
  description = "Inbound Security Group"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Additional inbound rules...
}

# Security group for outbound rules
resource "aws_security_group" "outbound_sg" {
  name        = "OutboundSecurityGroup"
  description = "Outbound Security Group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Additional outbound rules...
}

# Associate security groups with instances or resources as needed...
