### rake-deploy-eks
Deploy an app w/ secrets using...


### Prerequisites 
- AWS CLI `brew install awscli` and configure https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration
- Terraform `brew install terraform`
- Docker `brew install docker`

---

### Provision VPC and security groups

```
rake setup:network
```

---

### Provision multi-environment EKS cluster

The `default` workspace is used for production:
```
rake setup:cluster
```

Create cluster for new workspace (eg. `staging`):
```
rake setup:cluster[staging]
```

---

### Deploy app to EKS (per environment)

```
roadmap:
- rake task
- aws integration
```

---

### Run/test app in a docker container (per environment)

```
roadmap:
- docker file
- rspec
```

---

### Display info (per environment)

```
roadmap:
- rake task
 * show running instances
```

---

### Modify outbound TLS rules (per environment)

```
roadmap:
- rake task
```

---

### Edit secrets/credentials (per environment)

```
roadmap:
- rake task
```