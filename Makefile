# Setting SHELL to bash allows bash commands to be executed by recipes.
# Options are set to exit when a recipe line exits non-zero or a piped command fails.
SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec

CONTROLLER_GEN ?= ./bin/controller-gen
CONTROLLER_TOOLS_VERSION ?= v0.11.3

all:
	test -s $(CONTROLLER_GEN) || GOBIN=$(shell pwd)/bin go install sigs.k8s.io/controller-tools/cmd/controller-gen@$(CONTROLLER_TOOLS_VERSION)
	$(CONTROLLER_GEN) rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases
	$(CONTROLLER_GEN) object:headerFile="hack/boilerplate.go.txt" paths="./..."
