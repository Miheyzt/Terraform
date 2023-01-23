output "vpc_id" {
  value       = aws_vpc.tutorial_vpc.id
}

output "aws_subnet_group_name" {
  value       = aws_db_subnet_group.tutorial_db_subnet_group.id
}

output "vpc_security_group_ids" {
  value       = [aws_security_group.tutorial_db_sg.id]
}