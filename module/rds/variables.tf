variable "settings" {
    description = "Configuration settings"
    type = map(any)
    default = {
        "database" = {
            allocated_storage = 10
            engine = "postgres"
            engine_version = "12.9"
            instance_class = "db.t3.micro"
            db_name = "mishazt"
            skip_final_snapshot = true
        },
        "web_app" = {
            count = 1
            instance_type = "t2.micro"
        }
    }
}

variable "db_username" {
    description = "database master user"
    type = string
    sensitive = true
}

variable "db_subnet_group_name" {
    type = string
}

variable "vpc_security_group_ids" {
    type = list(string)
}
