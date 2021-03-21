output arn {
  value = aws_mq_broker.mq.arn
}

output id {
  value = aws_mq_broker.mq.id
}

output console_url {
  value = aws_mq_broker.mq.instances.0.console_url
}