## Pre-requisites

Install `nix` and finish `direnv` integration.

## Using the CLI

The compile and install the CLI:

```
go install
```

Run the CLI:

```
template-go-cli
```

Run the API server:

```
template-go-cli api
```

Run the TUI:

```
template-go-cli tui
```

Run the cdktf generator:

```
template-go-cli infra
```

Load and verify bash completion:

```
source /etc/profile.d/bash_completion.sh
eval "$(template-go-cli completion bash)"
complete -p template-go-cli
template-go-cli <TAB>
```

## Adding sub-commands

Use `cobra-cli` to add a command to the CLI.  For example, to add a `start` command:

```
cobra-cli add start
```
