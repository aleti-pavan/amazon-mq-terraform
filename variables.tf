variable engine_version {
  default = "3.8.6"
}

variable engine_type {
  default = "RabbitMQ"
}

variable host_instance_type {
  default = "mq.m5.large"
}

variable username {
  default = "mymquser"
}

variable password {
  default = "mymqpassword"
}

variable deployment_mode {
  default = "CLUSTER_MULTI_AZ"
}

variable publicly_accessible {
  default = true
}

variable mq_cluster_instance_count {
  default = "1"
}