# ci-tool-stack
This repository contains ressources needed for building and running a Continous Integration Plateform.
The set of Continuous Integration Tools Services are defined as docker-compose stack using docker images and deploy on docker hosts.

This project is inspired from "[docker-ci-tool-stack](https://github.com/marcelbirkner/docker-ci-tool-stack)" ideas

| *Components* | *Tools* | status |
| ------------- | ------------- | ------------- |
| Source code management | GitLab | **done** |
| Repository and artifact management | Nexus | **done** |
| CI/CD Tool | Jenkins | **done** |
| Data and Log Analysis | Elasticsearch/Logstash/Fluentd/Kibana | **done** | 
| Code Analysis | sonarqube | *todo* | 
| Browser Testing Tools | selenium grid | *todo* |
| Chat | rocket.chat | *todo* |

## Repository
This repository is the root of the ci tool stack.
It contains, build tools to generate all components and deploy

Build steps will produce 3 directories
  * [docker](docker) Dockerfiles
  * [ansible](ansible) roles and playbooks
  * [infra](infra) infrastructure definition

Repositories dependencies are defined in [requirements](requirements) files, and contains services and infrastructures components. Each services file are in other repositories
 * to build services
   * docker images
   * ansible roles and playbook to configure services
 * to deploy services
   * ansible roles/playbooks: to deploy services and infrastructures components (docker-compose services on docker hosts)
   * infrastructure plateforme definition: docker hosts in an openstack heat stack

## Services
All services are based on docker images derived from official images
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

### Infrastructure
Services (docker images and container) are deployed in docker-compose stack on docker host
Configuration and infrastructure components are defined in ansible configuration, roles and playbook

### Deployment roles (docker-host, docker-compose services stack)
  * infrastructure [docker-host](https://github.com/pli01/ansible-docker-host/) : roles to install docker host
  * services [service-ci-tool-stack](https://github.com/pli01/ansible-role-service-ci-tool-stack/) : roles to install all CI services  via docker-compose assignation on docker host.

## Infrastructure definition
Services are deployed through docker-compose stack on dockers hosts. 
Those hosts are defined in heat stack in openstack cloud
  * [openstack-heat](https://github.com/pli01/openstack-heat-templates/)

### Optional: Services configuration roles (nexus, gitlab)
  * [nexus3-oss](https://github.com/pli01/ansible-nexus3-oss/)
  * [gitlab-config](https://github.com/pli01/ansible-gitlab-config/)

### Optional: Infrastructure configuration roles (docker,ntp)
  * [ntp](https://github.com/pli01/ansible-role-ntp/)
  * [tinyproxy](https://github.com/pli01/ansible-role-tinyproxy/)
  * [docker-compose](https://github.com/pli01/ansible-role-docker-compose/)
  * [docker](https://github.com/pli01/ansible-role-docker/)
  * [systemd-service](https://github.com/pli01/ansible-role-systemd-service/)
  * [rsyslog](https://github.com/pli01/ansible-role-rsyslog/)
  * [openstack-client](https://github.com/pli01/ansible-role-openstack-client/)
  * [logrotate](https://github.com/pli01/ansible-role-logrotate/)

## Configuration definition
  * [To describe]
