# Install Kubeflow Example with using CentralDashboard helm chart

> [!NOTE]  
> This Folder is clone of KF manifests from: https://github.com/kubeflow/manifests/

Two folder: `/example` and `/example-with-helm` installs the example installation of Kubeflow ecosystem using Kustomize manifest.

But `/example-with-helm` uses the **helm chart** as a first step to support helm charts in Kubeflow.

In the [/example-with-helm/kustomization.yaml](example-with-helm/kustomization.yaml), **centraldashboard** is deployed using its helm chart found [here](example-with-helm/helm-charts/centraldashboard).

Its uses the [Kustomize helmCharts](https://github.com/kubernetes-sigs/kustomize/blob/master/examples/chart.md) feature to use the helm command line program in a subprocess to inflate a helm chart, generating YAML as part of (or as the entirety of) a kustomize base.

This `component-by-component` approach, to support helm charts in Kubeflow, ensures the use of existing workflow to test correctless of the helm chart and makes a foundation to create a complete, single mega helm chart of Kubeflow ecosystem.

To build the manifests, use:

```bash
kustomize build example # for /example

kustomize build --enable-helm example-with-helm # for /example-with-helm
```
See respective folder, for their respective builds.

The diff between these two builds are: [diff.txt](diff.txt)

or run:
```bash
diff example/kustomize-build.txt example-with-helm/kustomize-build-helm.txt
```