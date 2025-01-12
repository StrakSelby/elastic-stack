#!/bin/bash
export ES_PORT=9200
export CLUSTER_NAME=elasticsearch-cluster
export ELASTIC_PASSWORD=changeme
export LICENSE=basic
export STACK_VERSION=8.7.1
docker network create elastic
set -x
docker run -d \
  --name elasticsearch \
  --network elastic \
  --hostname es01 \
  --ulimit memlock=-1:-1 \
  -p ${ES_PORT}:9200 \
  -e "node.name=es01" \
  -e "cluster.name=${CLUSTER_NAME}" \
  -e "discovery.type=single-node" \
  -e "ELASTIC_PASSWORD=${ELASTIC_PASSWORD}" \
  -e "bootstrap.memory_lock=true" \
  -e "xpack.security.enabled=false" \
  -e "xpack.license.self_generated.type=${LICENSE}" \
  -v esdata01:/usr/share/elasticsearch/data \
  docker.elastic.co/elasticsearch/elasticsearch:${STACK_VERSION}

