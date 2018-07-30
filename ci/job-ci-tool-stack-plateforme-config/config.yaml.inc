- dev:
    env: dev
    dml_url: 'http://192.168.1.1'
    git_url: 'http://192.168.1.1'
    git_group: 'ci-tool-stack'
    git_repo: '{git_url}/{git_group}/{module}-{env}.git'
    git_web: '{git_url}/{git_group}/{module}-{env}'
    credential: jenkins-build-id
    url: "{dml_url}/nexus/repository/{module}-{plateforme}/{module}-{plateforme}/{version}/{module}-{plateforme}-openstack-heat-templates-{version}.tar.gz"
    os_project_name: "forge-dev"
# common openstack config
    os_identity_api_version: '3'
    os_auth_url: "https://identity.api.mycloud.fr/v3"
    os_user_domain_name: default
    os_project_domain_name: default
    os_region_name: region1
    os_interface: public
    os_cacert: "/etc/ssl/certs/ca-certificates.crt"
#    force_recreate: "true"
    force_recreate: "false"
    disable_job: true

- test:
    env: test
    dml_url: 'http://192.168.1.1'
    git_url: 'http://192.168.1.1'
    git_group: 'ci-tool-stack'
    git_repo: '{git_url}/{git_group}/{module}-{env}.git'
    git_web: '{git_url}/{git_group}/{module}-{env}'
    credential: jenkins-build-id
    url: "{dml_url}/nexus/repository/{module}-{plateforme}/{module}-{plateforme}/{version}/{module}-{plateforme}-openstack-heat-templates-{version}.tar.gz"
    os_project_name: "forge-qual"
# common openstack config
    os_identity_api_version: '3'
    os_auth_url: "https://identity.api.mycloud.fr/v3"
    os_user_domain_name: default
    os_project_domain_name: default
    os_region_name: region1
    os_interface: public
    os_cacert: "/etc/ssl/certs/ca-certificates.crt"
    force_recreate: "true"
    disable_job: true

- preprod:
    env: preprod
    dml_url: 'http://192.168.1.1'
    git_url: 'http://192.168.1.1'
    git_group: 'ci-tool-stack'
    git_repo: '{git_url}/{git_group}/{module}-{env}.git'
    git_web: '{git_url}/{git_group}/{module}-{env}'
    credential: jenkins-build-id
    url: "{dml_url}/nexus/repository/{module}-{plateforme}/{module}-{plateforme}/{version}/{module}-{plateforme}-openstack-heat-templates-{version}.tar.gz"
    os_project_name: "forge-preprod"
# common openstack config
    os_identity_api_version: '3'
    os_auth_url: "https://identity.api.mycloud.fr/v3"
    os_user_domain_name: default
    os_project_domain_name: default
    os_region_name: region1
    os_interface: public
    os_cacert: "/etc/ssl/certs/ca-certificates.crt"
    force_recreate: "false"
    disable_job: true

- prod:
    env: prod
    dml_url: 'http://192.168.1.1'
    git_url: 'http://192.168.1.1'
    git_group: 'ci-tool-stack'
    git_repo: '{git_url}/{git_group}/{module}-{env}.git'
    git_web: '{git_url}/{git_group}/{module}-{env}'
    credential: jenkins-build-id
    url: "{dml_url}/nexus/repository/{module}-{plateforme}/{module}-{plateforme}/{version}/{module}-{plateforme}-openstack-heat-templates-{version}.tar.gz"
    os_project_name: "forge-prod"
# common openstack config
    os_identity_api_version: '3'
    os_auth_url: "https://identity.api.mycloud.fr/v3"
    os_user_domain_name: default
    os_project_domain_name: default
    os_region_name: region1
    os_interface: public
    os_cacert: "/etc/ssl/certs/ca-certificates.crt"
    force_recreate: "false"
    disable_job: false
