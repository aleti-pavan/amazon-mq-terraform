variable engine_version {
  default = "3.8.6"
}

variable engine_type {
  default = "RabbitMQ"
}

variable host_instance_type {
  default = "mq.t3.micro"
}

variable username {
  default = "mymquser"
}

variable password {
  default = "mymqpassword"
}

variable deployment_mode {
  default = "SINGLE_INSTANCE"
}

variable publicly_accessible {
  default = true
}

variable mq_cluster_instance_count {
  default = "1"
}