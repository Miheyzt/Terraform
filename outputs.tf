output "web_public_ip" {
    description = "public ip address of the web server"
    value = aws_eip.tutorial_web_eip[0].public_ip
    depends_on = [aws_eip.tutorial_web_eip]
}

output "web_public_dns" {
    description = "public DNS address of the web server"
    value = aws_eip.tutorial_web_eip[0].public_dns
    depends_on = [aws_eip.tutorial_web_eip]
}

output "database_endpoint" {
    description = "the endpoint of db"
    value = aws_db_instance.tutorial_database.address
}

output "database_port" {
    description = "Port of db"
    value = aws_db_instance.tutorial_database.port
}