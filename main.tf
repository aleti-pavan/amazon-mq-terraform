provider aws {
  region = "us-east-2"
}

locals {
  create_kms_key = var.existing_kms_key_arn == null ? true : false
}

data "aws_caller_identity" "identity" {}

resource "aws_mq_broker" "mq" {
  broker_name        = var.broker_name
  engine_type        = var.engine_type
  engine_version     = var.engine_version
  host_instance_type = var.host_instance_type
  //  security_groups    = [aws_security_group.test.id]
  deployment_mode     = var.deployment_mode
  publicly_accessible = var.publicly_accessible
  storage_type        = var.storage_type
  tags                = var.tags

  encryption_options {
    kms_key_id        = local.create_kms_key ? aws_kms_key.mq_kms_key[0].arn : var.existing_kms_key_arn
    use_aws_owned_key = false
  }

  user {
    username = var.username
    password = var.password
  }
}

resource "aws_kms_key" "mq_kms_key" {
  count                   = local.create_kms_key ? 1 : 0
  deletion_window_in_days = 30
  description             = "Default/Created KMS Key for MQ Instance"
  enable_key_rotation     = true
  policy                  = templatefile(format("%s/policies/default_kms_key_policy.json", path.module), { ACCOUNT_ID = data.aws_caller_identity.identity.account_id })
  tags                    = var.tags
}

resource "aws_kms_alias" "mq_kms_key_alias" {
  count         = local.create_kms_key ? 1 : 0
  name_prefix   = "alias/default_mq_kms_key"
  target_key_id = aws_kms_key.mq_kms_key[0].id
}

// remove default tags, 38 line replace policy, remove aws provider in this file
// sg creation requires subnet but in terraform documentation is below

//subnet_ids - (Optional) List of subnet IDs in which to launch the broker. A SINGLE_INSTANCE deployment requires one subnet. An ACTIVE_STANDBY_MULTI_AZ deployment requires multiple subnets.