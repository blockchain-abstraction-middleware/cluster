deploy: 
	$(eval workspace=$(shell terraform workspace new deploy-cluster))
	terraform workspace select deploy-cluster

	terraform init ./deployments/staging/cluster
	terraform apply -auto-approve ./deployments/staging/cluster

	terraform output kube_config > ~/.kube/config

deploy_helm_and_state:
	$(eval tf_host=$(shell terraform output host))
	$(eval tf_port=$(shell terraform output port))
	$(eval tf_database=$(shell terraform output database))
	$(eval tf_user=$(shell terraform output user))
	$(eval tf_password=$(shell terraform output password))

	$(eval workspace=$(shell terraform workspace new helm_and_state))
	terraform workspace select helm_and_state

	terraform init ./deployments/staging/helm_and_state
	terraform apply \
		-auto-approve \
		-var 'host=$(tf_host)' \
		-var 'port=$(tf_port)' \
		-var 'database=$(tf_database)' \
		-var 'user=$(tf_user)' \
		-var 'password=$(tf_password)' \
	./deployments/staging/helm_and_state
	
destroy:
	terraform workspace select deploy-cluster
	terraform init ./deployments/staging/cluster
	terraform destroy -force ./deployments/staging/cluster

destroy_helm_and_state:
	terraform workspace select helm
	terraform init ./helm
	terraform destroy -force ./helm

get_kube_config:
	terraform workspace select deploy-cluster
	terraform output kube_config > ~/.kube/config

helm_install_external_dns:
	helm install --name external-dns \
		--namespace kube-system \
		--set provider=cloudflare \
		--set source=ingress \
		--set source=service \
		--set cloudflare.apiKey= \
		--set cloudflare.email= \
		stable/external-dns

.PHONY: \
	deploy \
	deploy_helm_and_state \
	destroy \
	destroy_helm_and_state \
	get_kube_config \
