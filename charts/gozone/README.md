# gozone

![Version: 0.7.3](https://img.shields.io/badge/Version-0.7.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.3](https://img.shields.io/badge/AppVersion-0.8.3-informational?style=flat-square)

A Helm chart for gozone

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| babykart | <babykart@gmail.com> | <https://github.com/babykart> |

## Source Code

* <https://github.com/babykart/gozone.git>

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

```sh
helm repo add babykart https://babykart.github.io/helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo
babykart` to see the charts.

To install the gozone chart:

```sh
helm upgrade --install gozone babykart/gozone
```

Using an OCI-based registry:

```sh
helm upgrade --install gozone oci://ghcr.io/babykart/helm-charts/gozone
 ```

To uninstall the chart:

```sh
helm delete gozone
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity |
| config.existingSecret | string | `""` | GoZone secret (if you want to use an existing secret). This secret must contains a key called 'config.yaml'. |
| config.gozoneConf | string | `""` | The config.yaml data content. |
| deployment.annotations | object | `{}` | Deployment annotations |
| deployment.labels | object | `{}` | Deployment labels |
| deployment.replicas | int | `1` | Deployment replica count |
| deployment.revisionHistoryLimit | int | `1` | Deployment revision history limit count |
| deployment.strategy.type | string | `"RollingUpdate"` | Deployment strategy type |
| dnsConfig | object | `{}` | DNS config |
| dnsPolicy | string | `"ClusterFirst"` | DNS policy |
| env | list | `[]` | Additional environment variables. |
| fullnameOverride | string | `""` | This is to override the full chart name. |
| httpRoute | object | `{"annotations":{},"enabled":false,"hostnames":["chart-example.local"],"parentRefs":[{"name":"gateway","sectionName":"http"}],"rules":[{"matches":[{"path":{"type":"PathPrefix","value":"/headers"}}]}]}` | Expose the service via gateway-api HTTPRoute Requires Gateway API resources and suitable controller installed within the cluster (see: https://gateway-api.sigs.k8s.io/guides/) |
| httpRoute.annotations | object | `{}` | HTTPRoute annotations. |
| httpRoute.enabled | bool | `false` | HTTPRoute enabled. |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. |
| image.registry | string | `"ghcr.io"` | This sets the repistry |
| image.repository | string | `"babykart/gozone"` | This sets the repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | This is for the secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| ingress.annotations | object | `{}` | Ingress annotations |
| ingress.className | string | `""` | Ingress className |
| ingress.enabled | bool | `false` | Ingress enabled |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | `{"httpGet":{"path":"/health/live","port":"http"},"initialDelaySeconds":3,"periodSeconds":30}` | This is to setup the liveness probe. More information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| nameOverride | string | `""` | This is to override the chart name. |
| nodeSelector | object | `{}` | This sets the nodeSelector labels |
| podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext | object | `{"fsGroup":65532}` | Pod SecurityContext |
| readinessProbe | object | `{"httpGet":{"path":"/health/ready","port":"http"},"initialDelaySeconds":3,"periodSeconds":30}` | This is to setup the readiness probe. |
| resources | object | `{}` |  |
| securityContext | object | `{}` | SecurityContext |
| service.ipFamilies | list | `["IPv4"]` | Service ipFamilies |
| service.ipFamilyPolicy | string | `"SingleStack"` | Service ipFamilyPolicy SingleStack|PreferDualStack|RequireDualStack |
| service.port | int | `8080` | This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports |
| service.type | string | `"ClusterIP"` | This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.automount | bool | `false` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| tolerations | list | `[]` | Tolerations |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
