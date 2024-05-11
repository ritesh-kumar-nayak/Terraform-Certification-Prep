output "instance_arn" {
  value       = aws_instance.ec2-for-state-demo[0].arn
  description = "This is EC2 ARN"

}

output "ec2_public_ip" {
  value       = aws_instance.ec2-for-state-demo[*].public_ip # As we are using count meta argument for multiple EC2 instances, here we have to access the instance using it's index. To access all the instanc we are using [*]
  description = "Public IP of instance"


}

