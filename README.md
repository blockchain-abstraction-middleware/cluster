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

### Step 2
- Setup k8s cluster
```shell
make setup
```
Running this step must be ran directly after Step 1 as it has dependancies on `terraform output`

### Validations
Run the following commands to validate everything has worked correctly

```shell
kubectl get pods --all-namespaces
```
See pod:
- tiller-deploy

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
