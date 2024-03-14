# router_configuration.tf

provider "aws" {
  region = "us-west-2"  
}

resource "aws_instance" "router" {
  ami           = "ami-1234567890abcdef0"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"

  # Other instance configuration...

  tags = {
    Name = "Router"
  }
}

resource "aws_network_interface" "router_interface" {
  # Interface configuration...

  tags = {
    Name = "Router Interface"
  }
}

resource "aws_route_table" "router_route_table" {
  # Route table configuration...

  tags = {
    Name = "Router Route Table"
  }
}

resource "aws_route" "ospf_route" {
  route_table_id         = "rtb-0123456789abcdef0"  
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id   = aws_network_interface.router_interface.id
  instance_id            = aws_instance.router.id 
}

