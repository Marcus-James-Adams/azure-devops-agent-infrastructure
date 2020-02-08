Azure  Devops Agent Docker Image
====================

This repository contains `Dockerfile` definitions for [marcus-james-adams/azure-devops-agent-infrastructure](https://github.com/marcus-james-adams/azure-devops-agent-infrastructure) Docker images.
It is based upon work previously created by [lenisha/vsts-agent-infrastructure](https://github.com/lenisha/vsts-agent-infrastructure)

[![Downloads from Docker Hub](https://img.shields.io/docker/pulls/marcus-james-adams/azure-devops-agent-infrastructure.svg)](https://registry.hub.docker.com/u/marcusjamesadams/azure-devops-agent-infrastructure)
[![Stars on Docker Hub](https://img.shields.io/docker/stars/marcus-james-adams/azure-devops-agent-infrastructure.svg)](https://registry.hub.docker.com/u/marcusjamesadams/azure-devops-agent-infrastructure) [![](https://images.microbadger.com/badges/image/marcus-james-adams/azure-devops-agent-infrastructure.svg)](https://microbadger.com/images/marcus-james-adams/azure-devops-agent-infrastructure "Get your own image badge on microbadger.com")


Docker image for Azure DevOps Agent with infrastrucure tools installed

Note Packer is locked at v1.4.5 as currently the powershell-dsc project is stalled/forgotton and it does not support the latest packer api changes

```
ENV TERRAFORM_VERSION 0.12.20
ENV PACKER_VERSION 1.4.5
ENV PACKER_WINDOWS_UPDATE_VERSION 0.8.0
ENV PACKER_DSC_VERSION 0.0.4-pre-release
ENV ANSIBLE_VERSION 2.9.4
```

## How to use these image
VSTS agents must be started with account connection information, which is provided through two environment variables:

- `VSTS_ACCOUNT`: the name of the Visual Studio account
- `VSTS_TOKEN`: a personal access token (PAT) for the Visual Studio account that has been given at least the **Agent Pools (read, manage)** scope.
- `VSTS_AGENT`: the name of the agent (default: `"$(hostname)"`)
- `VSTS_POOL`: the name of the agent pool (default: `"Default"`)


To run the default VSTS agent image for a specific Visual Studio account:

```
docker run \
  -e VSTS_ACCOUNT=<name> \
  -e VSTS_TOKEN=<pat> \
  -e VSTS_AGENT='$(hostname)-agent' \
  -e VSTS_POOL=mypool \
  -it marcus-james-adams/azure-devops-agent-infrastructure
```

## Notes
TODO: add automatic updates when new release posted

Other tools installed on VSTS image are listed:
[vsts agent tools](https://github.com/Microsoft/vsts-agent-docker/blob/6689c2bd45304ec56d2628f393355b52a451453e/README.md#standard-images)

