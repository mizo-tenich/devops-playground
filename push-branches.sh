#!/bin/bash
helmfile -f helm/localstack/helmfile.yaml apply
terraform -chdir=./terraform init
terraform -chdir=./terraform apply -auto-approve
data/upload-to-s3.sh releaseA
helmfile -f helm/neo4j/helmfile.yaml apply
