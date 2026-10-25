#!/usr/bin/env -S just --justfile

# Just list recipes
_default:
    @just --list

# Run helm lint for chart
helm-lint chart:
    {{ require("helm") }} lint --strict ./charts/{{ chart }}

# Generate the README.md for chart
helm-docs chart:
    {{ require("helm-docs") }} --document-dependency-values --chart-search-root ./charts/{{ chart }}

# Generate the values.schema.json for chart
helm-schema chart:
    {{ require("helm") }} schema --use-helm-docs -f ./charts/{{ chart }}/values.yaml -o ./charts/{{ chart }}/values.schema.json

# Generate the next release with tag
gen-rel tag:
    {{ require("git-cliff") }} --unreleased --tag {{ tag }} -o
    {{ require("git") }} commit -a -s -S -m "chore(release): prepare for {{ tag }}"
    {{ require("git") }} tag -s {{ tag }} -m "{{ tag }}"
