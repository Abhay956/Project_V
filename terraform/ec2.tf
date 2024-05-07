## VM with user data for webserver
resource "aws_instance" "myinstance1" {
  ami = "ami-079db87dc4c10ac91"
  instance_type = "t4g.micro:"
  key_name = "abhay-key"
  associate_public_ip_address = true
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.Project-v-sg.id]
  user_data = "${file("user-data.sh")}" 
  tags = {
        Name = "Webserver1"
  }
  root_block_device {
    volume_size = "20"  # Size in GB
    volume_type = "gp2"  # EBS volume type
  }

}

output "host_ip" {
 value = aws_instance.myinstance1.public_ip
}
output "instance_state" {
  description = "The state of the ec2 instance "
  value       = aws_instance.myinstance1.*.instance_state
}
