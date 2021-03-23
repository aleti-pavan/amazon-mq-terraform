# Amazon MQ

This project creates a basic amazon rabbit mq. Once you applied and played with it please make sure to delete the resource created to avoid bill from amazon.

## Variables
| Name | Value |
|------|--------|
| deployment_mode | `SINGLE_INSTANCE` or `CLUSTER_MULTI_AZ` |
| publicly_accessible | `true` or `false` |
| host_instance_type | `mq.m5.large` for deployment_mode `CLUSTER_MULTI_AZ` or `mq.t3.micro` for deployment_mode `SINGLE_INSTANCE` |


## Provision
```
terraform init
terraform plan
terraform apply -auto-approve
```

## Remove
`terraform destroy -auto-approve`