#!/bin/bash
docker build -t azure-devops-agent-infrastructure --build-arg VCS_REF="git rev-parse --short HEAD" .
docker tag azure-devops-agent-infrastructure marcusjamesadams/azure-devops-agent-infrastructure 
docker push marcusjamesadams/azure-devops-agent-infrastructure 