# Terraform cluster deployment

## Overview
Terraform script for deploying a cluster to Digital Ocean and setting up helm

Add your digital ocean token to `deployments/staging/cluster/variables.tf`

## Prerequisites
Install [teraform](https://www.terraform.io/)

### Step 1
- Deploy k8s cluster
```shell
make deploy
```
This will deploy a k8s cluster and download the `kube_config`

It also generates a `input.tfvars.json` file that is used in step 2

### Step 2
- Setup k8s cluster
```shell
make setup
```

### Validations
Run the following commands to validate everything has worked correctly

```shell
kubectl get pods --all-namespaces
```
See pods: 
- tiller-deploy
- istio-citadel
- istio-pilot
- istio-ingressgateway

```shell
kubectl get serviceaccounts --all-namespaces
```
See service account:
- tiller

```shell
kubectl get namespaces
```
See new namespaces:
- istio-system
- go-apis

### Step N
- Destroy k8s cluster
```shell
make destroy
```

## Beware of Dragons
1. `make setup` needs to be ran twice, race condition between installing istio crds and installing istio
