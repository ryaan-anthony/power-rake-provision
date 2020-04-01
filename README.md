### rake-deploy
Deploy an app w/ secrets using...


### Prerequisites 
- AWS CLI `brew install awscli` and configure https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#cli-quick-configuration
- Terraform `brew install terraform`
- Docker `brew install docker`

### 1. Create/update VPC network and EKS cluster

```
rake setup
```

---

### 2. Destroy VPC network and EKS cluster

```
rake destroy
```

---

### 3. Run/test app in a docker container (per workspace)

```
roadmap:
- docker file
- rspec
```

---

### 4. Deploy app to EKS (per workspace)

```
roadmap:
- rake task
- aws integration
```

---

### 5. Display info (per workspace)

```
roadmap:
- rake task
 * show running instances
```

---

### 6. Edit secrets/credentials (per workspace)

```
roadmap:
- rake task
```

---

### 7. Modify outbound TLS rules (per workspace)

```
roadmap:
- rake task
```
