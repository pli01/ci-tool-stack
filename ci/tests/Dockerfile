FROM debian:latest
# Build
ARG MIRROR_DEBIAN
ARG PYPI_URL
ARG PYPI_HOST
ARG PACKAGE_CUSTOM="make curl vim apt-transport-https ca-certificates python-setuptools python-wheel python-pip python-dev libyaml-dev python-stevedore"
# jenkins-job-builder"
# Run
ENV DEBIAN_FRONTEND noninteractive

# Use nexus repo to speed up build if MIRROR_DEBIAN defined
RUN echo "$APP_ENV $http_proxy $no_proxy" && set -x && [ -z "$MIRROR_DEBIAN" ] || \
     sed -i.orig -e "s|http://deb.debian.org/debian|$MIRROR_DEBIAN/debian9|g ; s|http://security.debian.org|$MIRROR_DEBIAN/debian9-security|g" /etc/apt/sources.list ; \
    apt-get -q update && \
    apt-get install -qy --no-install-recommends --force-yes \
      $PACKAGE_CUSTOM && \
    apt-get autoremove -y && apt-get autoclean -y &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY requirements.txt /root/requirements.txt

RUN set -ex && [ -z "$PYPI_URL" ] || pip_args=" --index-url $PYPI_URL " ; \
    [ -z "$PYPI_HOST" ] || pip_args="$pip_args --trusted-host $PYPI_HOST " ; \
    echo "$no_proxy" |tr ',' '\n' | sort -u |grep "^$PYPI_HOST$" || \
      [ -z "$http_proxy" ] || pip_args="$pip_args --proxy $http_proxy " ; \
    pip install $pip_args -I --no-deps -r /root/requirements.txt

COPY deployment.tar.gz /opt/deployment.tar.gz
COPY run.sh /run.sh
RUN chmod +x /run.sh && cd /opt && tar xvfz deployment.tar.gz

WORKDIR /opt

ENTRYPOINT ["/run.sh"]
