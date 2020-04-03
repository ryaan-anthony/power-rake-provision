# power-rake-provision
Provision an AWS account using terraform.


### Prerequisites 
- AWS credentials
- Terraform

### Configuration

```
export RAKE_PROJECT=example     # required
export RAKE_ENV=production      # default = development
```

### Available commands

> IMPORTANT: Create the `remote_state` first!

Run `bundle exec rake -T` to see available commands

```
bundle exec rake destroy:main          # Teardown main infrastructure for development
bundle exec rake destroy:remote_state  # Teardown remote state for development
bundle exec rake setup:main            # Create main infrastructure for development
bundle exec rake setup:remote_state    # Create remote state for development
```
