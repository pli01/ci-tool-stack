## TODO: extract in shell var
cat <<EOF > build-config.sh
REGISTRY_URL=${REGISTRY_URL}
REPOSITORY_HOST=${REPOSITORY_HOST}
EOF
cat <<'EOF' >> build-config.sh
REPOSITORY_URL=http://${REPOSITORY_HOST}/nexus/repository/${TARGET_REPOSITORY}
export REPOSITORY_URL REGISTRY_URL

# build params
MIRROR_DEBIAN=http://${REPOSITORY_HOST}/nexus/repository
MIRROR_DOCKER=http://${REPOSITORY_HOST}/nexus/repository/docker-project/linux
MIRROR_DOCKER_COMPOSE=http://${REPOSITORY_HOST}/nexus/repository/docker-compose
JENKINS_UC_URL=http://${REPOSITORY_HOST}/nexus/repository/jenkins-updates
PYPI_URL=http://${REPOSITORY_HOST}/nexus/repository/pypi/simple
PYPI_HOST=${REPOSITORY_HOST}
RUBY_URL=http://${REPOSITORY_HOST}/nexus/repository/rubygems/

export MIRROR_DEBIAN MIRROR_DOCKER MIRROR_DOCKER_COMPOSE JENKINS_UC_URL PYPI_URL PYPI_HOST RUBY_URL
EOF
