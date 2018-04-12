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

build:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build.sh $(PACKAGENAME) $(VERSION)

build-dev:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build-dev.sh $(PACKAGENAME) $(VERSION)

build-image:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/build-image.sh $(PACKAGENAME) $(VERSION)

test:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/test.sh $(PACKAGENAME) $(VERSION)

publish:
	APP_ENV=$(APP_ENV) bash -x ./$(tools_dir)/publish.sh $(PACKAGENAME) $(VERSION)
