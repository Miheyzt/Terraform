resource "aws_db_instance" "tutorial_database" {
    allocated_storage = var.allocated_storage
    engine = var.database_engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    db_name = var.db_name
    username = var.db_username
    password = "fastertutorialdbpassword"
    db_subnet_group_name = var.db_subnet_group_name
    vpc_security_group_ids = var.vpc_security_group_ids
    skip_final_snapshot = var.skip_final_snapshot
}
