# Setting SHELL to bash allows bash commands to be executed by recipes.
# Options are set to exit when a recipe line exits non-zero or a piped command fails.
SHELL = /usr/bin/env bash -o pipefail
.SHELLFLAGS = -ec

CONTROLLER_GEN ?= ./bin/controller-gen
CONTROLLER_TOOLS_VERSION ?= v0.11.3

ENVTEST ?= ./bin/setup-envtest
ENVTEST_TOOLS_VERSION ?= latest
ENVTEST_KUBEBUILDER_VERSION ?= 1.25.x!

meh:
	true

all:
	test -s $(CONTROLLER_GEN) || GOBIN=$(shell pwd)/bin go install sigs.k8s.io/controller-tools/cmd/controller-gen@$(CONTROLLER_TOOLS_VERSION)
	$(CONTROLLER_GEN) rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases
	$(CONTROLLER_GEN) object:headerFile="hack/boilerplate.go.txt" paths="./..."

test:
	test -s $(ENVTEST) || GOBIN=$(shell pwd)/bin go install sigs.k8s.io/controller-runtime/tools/setup-envtest@$(ENVTEST_TOOLS_VERSION)
	env KUBEBUILDER_ASSETS="$(shell $(ENVTEST) use $(ENVTEST_KUBEBUILDER_VERSION) --bin-dir ./bin/ -p path)" \
		go test ./... -coverprofile cover.out
