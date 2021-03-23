provider aws {
  region = "us-east-2"
}


resource "aws_mq_broker" "mq" {
//  count = var.mq_cluster_instance_count
  broker_name = "mq"
  engine_type        = var.engine_type
  engine_version     = var.engine_version
  host_instance_type = var.host_instance_type
  //  security_groups    = [aws_security_group.test.id]
  deployment_mode     = var.deployment_mode
  publicly_accessible = var.publicly_accessible

  user {
    username = var.username
    password = var.password
  }
}