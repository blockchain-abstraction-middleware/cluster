# Terraform cluster deployment

## Overview
Terraform script for deploying a cluster to Digital Ocean

Add your digital ocean token to `variables.tf`

## Prerequisites
Install [teraform](https://www.terraform.io/)

### Step 1
- Deploy k8s cluster
```shell
make deploy
```
This will deploy a k8s cluster on download the `kube_config`

### Step 2
- Deploy helm and state
```shell
make deploy_helm_and_state
```
Running this step must be ran directly after Step 1 as it has dependancies on `terraform output`

### Step N
- Destroy k8s cluster
```shell
make destroy
```

### Beware of Dragons
- Please run the steps in order!
- Helm install doesn't seem to be working
