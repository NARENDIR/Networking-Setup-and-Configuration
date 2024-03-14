# load_balancer.tf

resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-12345678", "subnet-87654321", "subnet-13579246"] 

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
  ami            = "ami-1234567890abcdef0"  
  instance_type  = "t2.micro"
  key_name       = "my-key-pair"  
  
 
}
