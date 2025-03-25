# Install Kubeflow Pipelines Standalone with Seaweedfs instead of MinIO using Kustomize Manifests

> [!NOTE]  
> This Folder is clone of KFP manifest from: https://github.com/kubeflow/manifests/tree/master/apps/pipeline/upstream

Use make commands to run KFP with Seaweedfs locally:
```bash
make install # it uses KFP_ENV=platform-agnostic and configures Seaweedfs access
make port-forward # forwards port 8080 for pipelines ui
```

This deploys Seaweedfs instead on MinIO: [seaweedfs-deployment.yaml](third-party/minio/base/seaweedfs-deployment.yaml)

Using following command, Seaweedfs is configured to run with KFP:
```bash
	kubectl -n kubeflow exec deployments/seaweedfs -c seaweedfs -- sh -c "echo \"s3.configure -user minio -access_key minio -secret_key minio123 -actions Read,Write,List -apply\" | /usr/bin/weed shell"
```