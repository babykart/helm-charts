# AGENTS.md

Helm chart repo: one directory per chart under `charts/` (`gozone`, `vault-unseal`). Charts publish to GitHub Pages (via chart-releaser) and `oci://ghcr.io/babykart/helm-charts` on tag push. No test suite; linting is the check.

## Commands

Recipes live in `justfile` and are per-chart (`<chart>` = `gozone` or `vault-unseal`):

- `just helm-lint <chart>` — `helm lint --strict`. Run after any template/values change.
- `just helm-docs <chart>` — regenerate `charts/<chart>/README.md` from `README.md.gotmpl` + `values.yaml`.
- `just helm-schema <chart>` — regenerate `charts/<chart>/values.schema.json` from `values.yaml` (needs the `helm schema` plugin, e.g. losisin/helm-values-schema-json).
- `just gen-rel <tag>` — release step, see below.

Tools: `just`, `helm`, `helm-docs`, `git-cliff`. Commits are created with `-s -S` (signoff + GPG/SSH signature), so unsigned commits break the release recipe.

## Generated files — never hand-edit

- `charts/*/README.md` — edit `README.md.gotmpl` / `values.yaml`, then run `just helm-docs <chart>`.
- `charts/*/values.schema.json` — edit `values.yaml`, then run `just helm-schema <chart>`.
- `CHANGELOG.md` — produced by git-cliff (`cliff.toml` config).

Root `README.md` is hand-written.

## Release flow (order matters)

Tags are `<chart>-<version>` (e.g. `gozone-1.0.0`) and trigger `.github/workflows/release.yml`:

1. Commit chart changes. Bump `version` (and `appVersion` when the app image changed) in `Chart.yaml`; commit message convention: `build(helm): [helm-charts] <chart>-<version>`.
2. `just gen-rel <chart>-<version>` — git-cliff updates `CHANGELOG.md`, commits `chore(release): prepare for <tag>`, creates the signed tag.
3. Push the tag. CI packages, publishes the Pages index, and pushes OCI images.

## Conventions and gotchas

- Conventional Commits required: git-cliff groups `CHANGELOG.md` by commit type/scope (scope `helm` is the norm).
- Both charts are near-identical scaffolds (same helpers/template layout); mirror structural changes across them.
- Image tag defaults to `.Chart.appVersion` when `image.tag` is empty, so an app upgrade usually means bumping `appVersion`, not values.
- YAML indent 2, JSON indent 4 (`.editorconfig`). `.cr-release-packages/` and `.cr-index/` are chart-releaser artifacts, gitignored.
- Known latent bug in `charts/gozone/templates/deployment.yaml`: the config-secret path uses `include "garnet.fullname"` but that helper does not exist in this chart (copy-paste from another repo). Defaults never render that branch, so lint passes; it only breaks when `config.gozoneConf` or `config.existingSecret` is set. Fix to `gozone.fullname` when touching that file.
