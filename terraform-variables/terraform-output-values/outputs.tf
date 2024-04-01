# Define Output values
# Attribute Reference: EC2 Instance Public Ip
output "public_ip" {
  value       = aws_instance.instance_for_opv.public_ip
  description = "public ip of the instance"
}

# Argument Reference: EC2 Instance Private IP
output "private_ip" {
  value       = aws_instance.instance_for_opv.private_ip
  description = "Private ip of the instance"

}
# Argument Reference: Security group associated with EC2 instance
output "security_groups" {
  value       = aws_instance.instance_for_opv.security_groups
  description = "List of ecurity groups"

}
# Attribute Reference: Create public DNS URL with http:// appended

output "public_dns" {
  value = "http://${aws_instance.instance_for_opv.public_dns}"
  sensitive = true  #  this makes the output hiden. 

}


/* 
References: https://developer.hashicorp.com/terraform/language/values/outputs

"terraform output" command is used to print the output in the console. It querries the tfstate file 
and fetches the output values.

NOTE: when we use "terraform output anyVariableName" then, the value gets printed in console irrespective of
being sensitive or insensitive.

"terraform output -json" is the command that is used to print the output in JSON format

*/