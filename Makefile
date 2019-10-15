deploy: 
	$(eval workspace=$(shell terraform workspace new deploy-cluster))
	terraform workspace select deploy-cluster

	terraform init ./deployments/staging/cluster
	terraform apply -auto-approve ./deployments/staging/cluster
	
setup:
	$(eval workspace=$(shell terraform workspace new setup))
	terraform workspace select setup

	terraform init ./deployments/staging/setup
	terraform apply \
	 	-auto-approve \
		-var-file="input.tfvars.json" \
	./deployments/staging/setup
	
destroy:
	terraform workspace select deploy-cluster
	terraform init ./deployments/staging/cluster
	terraform destroy -force ./deployments/staging/cluster

destroy_setup:
	terraform workspace select helm
	terraform init ./helm
	terraform destroy -force ./helm

.PHONY: \
	deploy \
	setup \
	destroy \
	destroy_setup