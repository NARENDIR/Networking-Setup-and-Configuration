# load_balancer.tf

resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-xxxxxx", "subnet-yyyyyy", "subnet-zzzzzz"]

  enable_deletion_protection = false

  enable_cross_zone_load_balancing = true

  enable_http2 = true
}

resource "aws_security_group" "lb_sg" {
  name        = "lb-security-group"
  description = "Security group for the load balancer"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Additional rules...
}

# Backend servers
resource "aws_instance" "backend_servers" {
  count          = 3
  ami            = "your_backend_server_ami"
  instance_type  = "t2.micro"
  key_name       = "your_key_pair"
  
  # Other instance configuration...
}
