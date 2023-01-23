variable "db_username" {
    description = "database master user"
    type = string
    sensitive = true
}

variable "allocated_storage" {
    type = number
}

variable "database_engine" {
    type = string
}

variable "engine_version" {
    type = string
}

variable "instance_class" {
    type = string
}

variable "db_name" {
    type = string
    default = "mishazt"
}

variable "skip_final_snapshot" {
    type = bool
    default = true
}

variable "db_subnet_group_name" {
    type = string
}

variable "vpc_security_group_ids" {
    type = set(string)
}
