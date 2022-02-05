# Thanos openstack

Deploy and configure a light thanos stack.

## Deploy infrastructure

### Requirements

- Terraform
- Credential clouds.yaml

### How to deploy?

> Step 1

Get your pub key and copy past into the ressource keypair to be able to authentificate to serveur with your own ssh key. This ssh key will be required to deploy with ansible.

> Step 2

``` bash
mv clouds.yaml terraform
cd terraform
terraform init
terraform plan # check all your futhur ressources
terraform apply
```

> Step 3

Check all instances are created in horizon.

## Deploy thanos

### Requirements

- python 3.10
- pipenv
- You to manualy populate your inventory.
To do that you have to get instances from horizon and then generate a invetory with this kind of strucutre :

``` yaml
[thanos-query-frontend]
152.228.212.234 # all instance with prefix : thanos-query-frontend-*

[thanos-query]
152.228.215.162  # all instance with prefix : thanos-query-*

[thanos-receiver]
141.95.150.4  # all instance with prefix : thanos-receiver-*

[nginx-lb-query]
152.228.213.200 # all instance with prefix : nginx-lb-query-*
```

### How to deploy?

> Step 1
The debian user is created by default

``` yaml
cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook -i inventory/hosts site.yml -u debian
```

