#!/bin/bash

docker pull ghcr.io/chaos-mesh/chaos-coredns:v0.2.6
docker pull ghcr.io/chaos-mesh/chaos-mesh:v2.6.2
docker pull ghcr.io/chaos-mesh/chaos-daemon:v2.6.2
docker pull ghcr.io/chaos-mesh/chaos-dashboard:v2.6.2
docker pull confluentinc/cp-zookeeper:7.3.5
docker pull confluentinc/cp-kafka:7.3.5
kind delete cluster
kind create cluster --config cluster.yml
kind load docker-image ghcr.io/chaos-mesh/chaos-coredns:v0.2.6
kind load docker-image ghcr.io/chaos-mesh/chaos-mesh:v2.6.2
kind load docker-image ghcr.io/chaos-mesh/chaos-daemon:v2.6.2
kind load docker-image ghcr.io/chaos-mesh/chaos-dashboard:v2.6.2
kind load docker-image confluentinc/cp-zookeeper:7.3.5
kind load docker-image confluentinc/cp-kafka:7.3.5
curl -sSL https://mirrors.chaos-mesh.org/v2.6.2/install.sh | bash
