# power-rake-provision
Provision a load balanced application server using Terraform.

- Multi-project/multi-environment configuration via Power Rake.
- Remote state is persisted to an AWS S3 bucket.
- Deploy keys are created and persisted to AWS Secrets Manager.
- SSL certs pulled from AWS Certificate Manager.

### Prerequisites 

- AWS authentication
- Terraform
- S3 bucket and dynamodb table (can be the same for all projects/environments)

        IMPORTANT: The table must have a primary key "LockID"
      
        Read more: https://www.terraform.io/docs/backends/types/s3.html

### Power Rake Configuration

```
export RAKE_ENV=production                  # default = development
export RAKE_PROJECT=example                 # required - used to identify the current project
```

Want to have separate config files for different projects?

```
export RAKE_CONFIG=other-project.yml        # optional - path to yaml file
```

### AWS configuration

```
export AWS_S3_BUCKET=example                # required - used to store the tf state
export AWS_DYNAMODB_TABLE=example           # required - used to hold the lock ID
export AWS_VPC_ID=vpc-123                   # required
export AWS_CERT_ARN=arn:aws:acm:etc...      # required
export AWS_INSTANCE_AMI=ami-123             # required
```

> See power-rake.yml for more options


### Available commands

```
bundle exec rake init                       # Run terraform init
bundle exec rake plan                       # Run terraform plan
bundle exec rake apply                      # Run terraform apply
bundle exec rake destroy                    # Run terraform destroy
```
