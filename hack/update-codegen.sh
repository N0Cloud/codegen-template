#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ${GOPATH}/src/k8s.io/code-generator)}

${CODEGEN_PKG}/generate-groups.sh "deepcopy,client,informer,lister" \
  github.com/N0Cloud/codegen-template/client github.com/N0Cloud/codegen-template/api \
  test:v1,v2 \
  --go-header-file ${SCRIPT_ROOT}/hack/custom-boilerplate.go.txt