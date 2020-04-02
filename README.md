# power-rake-provision
Provision an AWS account using terraform.


### Prerequisites 
- AWS credentials
- Terraform `brew install terraform`

### 1. Create infrastructure

```
bundle exec rake setup
```

---

### 2. Update infrastructure

```
bundle exec rake update
```


---

### 3. Destroy infrastructure

```
bundle exec rake destroy
```
