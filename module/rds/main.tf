resource "aws_db_instance" "tutorial_database" {
    allocated_storage = var.settings.database.allocated_storage
    engine = var.settings.database.engine
    engine_version = var.settings.database.engine_version
    instance_class = var.settings.database.instance_class
    db_name = var.settings.database.db_name
    username = var.db_username
    password = "fastertutorialdbpassword"
    db_subnet_group_name = var.db_subnet_group_name
    vpc_security_group_ids = var.vpc_security_group_ids
    skip_final_snapshot = var.settings.database.skip_final_snapshot
}
