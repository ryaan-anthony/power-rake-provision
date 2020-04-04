# power-rake-provision
Provision an AWS account using terraform.


### Prerequisites 
- AWS authentication
- Terraform
- S3 bucket and Dynamodb table for remote state & locking


### Configuration

> S3 bucket and dynamodb table can be the same for all projects/environments.
> IMPORTANT: The table must have a primary key named LockID.

```
export RAKE_ENV=production          # default = development
export RAKE_PROJECT=example         # required - used to identify the current project
export AWS_S3_BUCKET=example        # required - used to store the tf state
export AWS_DYNAMODB_TABLE=example   # required - used to hold the lock ID
```

### Available commands

```
bundle exec rake setup    # Run terraform apply
bundle exec rake destroy  # Run terraform destroy
```
