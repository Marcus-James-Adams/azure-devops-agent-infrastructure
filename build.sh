#!/bin/bash
docker build -t azure-devops-agent-infrastructure --build-arg VCS_REF="git rev-parse --short HEAD" .
docker tag azure-devops-agent-infrastructure marcus-james-adams/azure-devops-agent-infrastructure 
docker push marcus-james-adams/azure-devops-agent-infrastructure 