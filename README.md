# helm-charts

[![License](https://img.shields.io/badge/License-MIT-blue)](https://opensource.org/licenses/MIT)

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

To install a chart:

```sh
helm upgrade --install <chart> babykart/<chart>
```

Using an OCI-based registry:

```sh
helm upgrade --install <chart> oci://ghcr.io/babykart/helm-charts/<chart>
 ```

To uninstall the chart:

```sh
helm delete <chart>
```
