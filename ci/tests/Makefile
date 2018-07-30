name                 ?= jenkins-job-builder
VERSION ?= $(shell [ -f VERSION ] && cat VERSION)

test_archive         ?= deployment.tar.gz
base_directory       ?= ..
test_setup_directory ?= tests
.PHONY: clean

compose_args += -f docker-compose.yml
compose_args += $(shell [ -f  docker-compose.$(env).yml ] && echo "-f docker-compose.$(env).yml")

default: build

debug: package build-container run-container-debug
build: package build-container run-container clean

prepare:
	cp Dockerfile Dockerfile.template && \
	sed -e 's|\(FROM .*\):\(.*\)|\1:$(VERSION)|' Dockerfile.template > Dockerfile.$(VERSION)

build-container: prepare
	echo "# build $(name) container and test job in it"
	VERSION=$(VERSION) docker-compose $(compose_args) build

run-container:
	docker-compose $(compose_args) config
	docker-compose -p $(name) run --name "test-$(name)"  -T --rm --entrypoint jenkins-jobs $(name) --version
	docker-compose -p $(name) run --name "test-$(name)"  -T --rm  $(name)

run-container-debug:
	docker run $(run_args) -it -v $(shell pwd)/../:/opt --entrypoint /bin/bash --rm $(name):$(VERSION)

package: clean
	cd $(base_directory) && tar --exclude .git --exclude tests -zcvf $(test_setup_directory)/$(test_archive) .

clean:
	if [ -f $(test_archive) ]; then rm $(test_archive) ;fi
	if [ -f Dockerfile.template ]; then rm Dockerfile.template ;fi
	if [ -f Dockerfile.$(VERSION) ]; then rm Dockerfile.$(VERSION) ;fi

clean-docker-image:
	docker rmi $(name):$(VERSION) || true

