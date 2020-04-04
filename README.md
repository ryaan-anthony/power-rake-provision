# power-rake-provision
Provision an AWS account using terraform.

### Prerequisites 
- AWS authentication
- Terraform
- S3 bucket and dynamodb table (can be the same for all projects/environments)
    > IMPORTANT: The table must have a primary key named LockID
    
    > Read more: https://www.terraform.io/docs/backends/types/s3.html

### Configuration

```
export RAKE_ENV=production                      # default = development
export RAKE_PROJECT=example                     # required - used to identify the current project
export AWS_S3_BUCKET=example                    # required - used to store the tf state
export AWS_DYNAMODB_TABLE=example               # required - used to hold the lock ID
```

### Additional configuration

These values are required and must exist before initial setup!

```
export AWS_VPC_ID=vpc-123
export AWS_CERT_ARN=arn:aws:acm:etc...
export AWS_INSTANCE_AMI=ami-123
```

> See power-rake.yml for more options


### Available commands

```
bundle exec rake setup    # Run terraform apply
bundle exec rake destroy  # Run terraform destroy
```
