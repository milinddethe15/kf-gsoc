# This makefile is a quick test to verify all manifests can be hydrated.

test: aws azure dev gcp platform-agnostic platform-agnostic-multi-user

aws: FORCE
	kubectl kustomize env/aws

azure: FORCE
	kubectl kustomize env/azure

dev: FORCE
	kubectl kustomize env/dev

gcp: FORCE
	kubectl kustomize env/gcp

platform-agnostic: FORCE
	kubectl kustomize env/platform-agnostic

platform-agnostic-multi-user: FORCE
	kustomize build --load-restrictor LoadRestrictionsNone env/platform-agnostic-multi-user

FORCE: ;

# Installation KFP local
install: install-cluster-resources wait-crds install-env-resources wait-pods configure-seaweedfs

KFP_ENV ?= platform-agnostic

install-cluster-resources: 
	kustomize build cluster-scoped-resources/ | kubectl apply -f -

wait-crds:
	kubectl wait crd/applications.app.k8s.io --for condition=established --timeout=60s

install-env-resources:
	kustomize build "env/$(KFP_ENV)/" | kubectl apply -f -

wait-pods:
	kubectl wait pods -l application-crd-id=kubeflow-pipelines -n kubeflow --for condition=Ready --timeout=1800s
	@echo "Installation completed successfully!"
	@echo "Run 'make port-forward' to access the UI"

port-forward:
	kubectl port-forward -n kubeflow svc/ml-pipeline-ui 8080:80

# Configure SeaweedFS S3 access
configure-seaweedfs:
	kubectl -n kubeflow exec deployments/seaweedfs -c seaweedfs -- sh -c "echo \"s3.configure -user minio -access_key minio -secret_key minio123 -actions Read,Write,List -apply\" | /usr/bin/weed shell"

.PHONY: install install-cluster-resources wait-crds install-env-resources wait-pods port-forward configure-seaweedfs