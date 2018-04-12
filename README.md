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
It contains, build tools to generate all components and deploy

Build steps will produce 3 directories
  * [docker](docker) Dockerfiles
  * [ansible](ansible) roles and playbooks
  * [infra](infra) infrastructure definition

Repositores dependencies are defined [requirements](requirements) files, and contains services and infrastructures components
 * to build services
   * docker images
   * ansible roles and playbook to configure services
 * to deploy services
   * ansible roles/playbooks: to deploy services and infrastructures components (docker-compose services on docker hosts)
   * infrastructure plateforme definition: docker hosts in an openstack heat stack

## Services
All services are docker images derived from official images
Repositories dependencies are defined in [requirements-dev](requirements-dev)

  * [jenkins](https://github.com/pli01/docker-jenkins/)
  * [gitlab-ce](https://github.com/pli01/docker-gitlab-ce/)
  * [sonatype-nexus3](https://github.com/pli01/docker-sonatype-nexus3/)
  * [logstash](https://github.com/pli01/docker-logstash/)
  * [fluentd](https://github.com/pli01/docker-fluentd/)
  * [elasticsearch](https://github.com/pli01/docker-elasticsearch/)
  * [kibana](https://github.com/pli01/docker-kibana/)
  * [service-config](https://github.com/pli01/docker-service-config/)
  * [nginx](https://github.com/pli01/docker-nginx/)

## Services Configuration and infrastructure
Configuration and infrastructures component are defined in ansible roles

### Services Configuration roles (nexus, gitlab)
  * [nexus3-oss](https://github.com/pli01/ansible-nexus3-oss/)
  * [gitlab-config](https://github.com/pli01/ansible-gitlab-config/)

### Infrastructure configuration component (docker,ntp)
  * [ntp](https://github.com/pli01/ansible-role-ntp/)
  * [tinyproxy](https://github.com/pli01/ansible-role-tinyproxy/)
  * [docker-compose](https://github.com/pli01/ansible-role-docker-compose/)
  * [docker](https://github.com/pli01/ansible-role-docker/)
  * [systemd-service](https://github.com/pli01/ansible-role-systemd-service/)

### Deployment roles (docker-host, docker-compose services stack)
  * [docker-host](https://github.com/pli01/ansible-docker-host/)
  * [service-ci-tool-stack](https://github.com/pli01/ansible-role-service-ci-tool-stack/)

## Infrastructure definition
Services are deployed through docker-compose stack on dockers hosts. 
Those hosts are defined in heat stack in openstack cloud
  * [openstack-heat](https://github.com/pli01/openstack-heat-templates/)

## Configuration definition
