APP_ENV ?= dev
PACKAGENAME ?= ci-tool-stack
VERSION ?= latest

default: help
tools_dir = tools

.PHONY: help
help:
	@echo "make [import | build | test | publish]"

.PHONY: import build test publish package

clean:
	if [ -d build ] ; then rm -rf build ; fi
	if [ -d dist ] ; then rm -rf dist ; fi
package:
	APP_ENV=$(APP_ENV) bash ./$(tools_dir)/package.sh $(PACKAGENAME) $(VERSION)

import:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/import.sh $(PACKAGENAME) $(VERSION)

build: build-image build-service build-infra
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build.sh $(PACKAGENAME) $(VERSION)

build-dev:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build-dev.sh $(PACKAGENAME) $(VERSION)

build-image: pull-image
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build-image.sh $(PACKAGENAME) $(VERSION)
pull-image:
	APP_ENV=$(APP_ENV) bash ./$(tools_dir)/pull-image.sh $(PACKAGENAME) $(VERSION)
test-image:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/test-image.sh $(PACKAGENAME) $(VERSION)
push-image:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/push-image.sh $(PACKAGENAME) $(VERSION)
publish-image:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/publish-image.sh $(PACKAGENAME) $(VERSION)

build-service:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build-service.sh $(PACKAGENAME) $(VERSION)
build-infra:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build-infra.sh $(PACKAGENAME) $(VERSION)


test:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/test.sh $(PACKAGENAME) $(VERSION)

publish:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/publish.sh $(PACKAGENAME) $(VERSION)
