# ci-tool-stack
This repository contains ressources needed for building and running a set of Continuous Integration Tools
Services of the Continous Integration Plateform are defined as docker images, deploy on docker host

This project is derived from "`docker-ci-tool-stack repository`" ideas

| *Components* | *Tools* | status |
| ------------- | ------------- | ------------- |
| Source code management | GitLab | **done** |
| Repository and artifact management | Nexus | **done** |
| CI/CD Tool | Jenkins | **done** |
| Data and Log Analysis | Elasticsearch/Logstash/Fluentd/Kibana | in progress | 
| Code Analysis | sonarqube | *todo* | 
| Browser Testing Tools | selenium grid | *todo* |

## Repository
This repository is the root of the ci tool stack.
Following repository contains services and infrastructures components

## Ressources:
 * to build services
   * docker images
   * ansible roles and playbook to configure services
 * to deploy services
   * ansible roles/playbooks: to deploy services and infrastructures components
   * plateforme infrastructure definition: docker-compose, openstack

## Services
All services are defined as docker images derived from official images
Repositories are defined in [requirements-dev](requirements-dev)
  * [jenkins] (https://github.com/pli01/docker-jenkins/)
  * [gitlab-ce] (https://github.com/pli01/docker-gitlab-ce/)
  * [sonatype-nexus3] (https://github.com/pli01/docker-sonatype-nexus3/)
  * [logstash] (https://github.com/pli01/docker-logstash/)
  * [fluentd] (https://github.com/pli01/docker-fluentd/)
  * [elasticsearch] (https://github.com/pli01/docker-elasticsearch/)
  * [kibana] (https://github.com/pli01/docker-kibana/)
  * [service-config] (https://github.com/pli01/docker-service-config/)
  * [nginx] (https://github.com/pli01/docker-nginx/)
