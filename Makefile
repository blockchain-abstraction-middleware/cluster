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
	# terraform workspace select setup
	# terraform init ./deployments/staging/setup
	# terraform destroy -force -var-file="input.tfvars.json" ./deployments/staging/setup

	terraform workspace select deploy-cluster
	terraform init ./deployments/staging/cluster
	terraform destroy -force ./deployments/staging/cluster

	rm input.tfvars.json

destroy_setup:
	terraform workspace select setup
	terraform init ./deployments/staging/setup
	terraform destroy -force -var-file="input.tfvars.json" ./deployments/staging/setup

.PHONY: \
	deploy \
	setup \
	destroy \
	destroy_setup