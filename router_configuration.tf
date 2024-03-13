# router_configuration.tf

provider aws {
  region = your_region
}

resource aws_instance router {
  ami           = your_router_ami
  instance_type = t2.micro
  key_name      = your_key_pair

  # Other instance configuration...

  tags = {
    Name = Router
  }
}

# Configure OSPF
resource aws_network_interface router_interface {
  # Interface configuration...

  tags = {
    Name = Router Interface
  }
}

resource aws_route_table router_route_table {
  # Route table configuration...

  tags = {
    Name = Router Route Table
  }
}

resource aws_route ospf_route {
  route_table_id         = aws_route_table.router_route_table.id
  destination_cidr_block = 0.0.0.00
  network_interface_id   = aws_network_interface.router_interface.id
  instance_id            = aws_instance.router.id
}

# Additional configuration for BGP if needed...
