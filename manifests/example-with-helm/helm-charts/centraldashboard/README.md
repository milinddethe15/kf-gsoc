# Centraldashboard Helm Chart

This Helm chart installs the Kubeflow Central Dashboard.

### Installation

```bash
helm install centraldashboard ./centraldashboard
```

### Uninstallation

```bash
helm uninstall centraldashboard
```

#### Values

| Parameter | Description | Default |
|-----------|-------------|---------|
| `namespace` | Namespace to install resources | `kubeflow` |
| `image.repository` | Image repository | `ghcr.io/kubeflow/kubeflow/central-dashboard` |
| `image.tag` | Image tag | `v1.10.0` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `service.type` | Service type | `ClusterIP` |
| `service.port` | Service port | `80` |
| `service.targetPort` | Container port | `8082` |
| `deployment.replicas` | Number of replicas | `1` |
| `env.*` | Environment variables | see [values.yaml](values.yaml) |
| `config.*` | ConfigMap settings | see [values.yaml](values.yaml) |
