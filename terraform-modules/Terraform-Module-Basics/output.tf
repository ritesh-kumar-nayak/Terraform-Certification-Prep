output "ec2_public_ip" {
    description = "Public IP of the instance"
    value = module.ec2-instance-demo.*.public_ip # This is way of getting output for multiple instances
  
}

output "ec2_public_dns" {
    description = "DNS of the instance"
    value = module.ec2-instance-demo[*].public_dns # This is another way of getting output for a list of object(Multiple instance)
  
}

output "private_dns" {
    description = "Private DNS of the instance"
    value = module.ec2-instance-demo.*.private_dns
  
}

output "availability_zone" {
    description = "Deployed AZ"
    value = module.ec2-instance-demo.*.availability_zone
  
}

# While using modules, we can refer to output attributes by "module.instance_name.output_attribute"