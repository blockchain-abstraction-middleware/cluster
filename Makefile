deploy: 
	$(eval workspace=$(shell terraform workspace new deploy-cluster))
	terraform workspace select deploy-cluster

	terraform init ./deployments/staging/cluster
	terraform apply -auto-approve ./deployments/staging/cluster
	
setup:
	$(eval tf_host=$(shell terraform output host))
	$(eval tf_port=$(shell terraform output port))
	$(eval tf_database=$(shell terraform output database))
	$(eval tf_user=$(shell terraform output user))
	$(eval tf_password=$(shell terraform output password))

	$(eval workspace=$(shell terraform workspace new setup))
	terraform workspace select setup

	terraform init ./deployments/staging/setup
	terraform apply \
	 	-auto-approve \
		-var 'host=$(tf_host)' \
		-var 'port=$(tf_port)' \
		-var 'database=$(tf_database)' \
		-var 'user=$(tf_user)' \
		-var 'password=$(tf_password)' \
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
	destroy_setup \
	get_kube_config \
