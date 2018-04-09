cat <<EOF > build-file
#
https://github.com/pli01/ansible-nexus3-oss
https://github.com/pli01/ansible-gitlab-config
#
https://github.com/pli01/docker-nginx
https://github.com/pli01/docker-jenkins
https://github.com/pli01/docker-gitlab-ce
https://github.com/pli01/docker-sonatype-nexus3
https://github.com/pli01/docker-service-config
https://github.com/pli01/docker-logstash
https://github.com/pli01/docker-fluentd
https://github.com/pli01/docker-elasticsearch
https://github.com/pli01/docker-kibana
#
https://github.com/pli01/ansible-role-ntp
https://github.com/pli01/ansible-role-tinyproxy
https://github.com/pli01/ansible-role-docker-compose
https://github.com/pli01/ansible-role-docker
https://github.com/pli01/ansible-role-systemd-service
#
https://github.com/pli01/ansible-docker-host
https://github.com/pli01/ansible-role-service-ci-tool-stack
https://github.com/pli01/openstack-heat-templates
EOF

cat <<'EOS' > build-ci.sh
#!/bin/bash

file=${1:? $0 file not defined}

for f in $(grep -v '^#' $file) ; do
  echo "# $f"
  dir=$(basename $f)
  [ -d $dir ] || git clone $f
  ( cd $dir && git pull --rebase )
done
EOS

bash build-ci.sh build-file
