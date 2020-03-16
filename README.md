### rake-deploy-eks
Deploy an app w/ secrets using...

- Terraform `brew install terraform`
- Docker `brew install docker`
- AWS CLI `brew install awscli`
- Kubernetes

### Provision multi-environment EKS cluster

The `default` environment is used for production:
```
rake provision
```

Create cluster for new environment (eg. `staging`):
```
rake provision staging
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

### Display info (per environment)

```
roadmap:
- rake task
 * show running instances
```

### Modify outbound TLS rules (per environment)

```
roadmap:
- rake task
```

### Edit secrets/credentials (per environment)

```
roadmap:
- rake task
```