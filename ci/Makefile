SHELL = /bin/bash
JJB_JOBS ?= jobs-deployer
OUTPUT ?= output
JJB_USER ?= admin
JJB_VERSION = $(shell jenkins-jobs --version 2>&1 |awk -F: ' { print $$2 }' | sed -e 's/ //g' )
JJB_CONFIG = $(shell if [ -f "$$HOME/.config/jenkins_jobs/jenkins_jobs_$(JJB_USER).ini" ] ; then echo "--conf $$HOME/.config/jenkins_jobs/jenkins_jobs_$(JJB_USER).ini" ; fi)
JJB_ARGS = --flush-cache --ignore-cache
.PHONY: clean test update unit-test

default: update

unit-test:
	( cd tests && make build clean clean-docker-image )
	( cd tests && make clean clean-docker-image )
test:
	rm -rf $(OUTPUT)/$(JJB_JOBS) ||true
	if [ ! -d "$(OUTPUT)" ] ; then mkdir -p $(OUTPUT) ; fi
	JJB_OUTOPT="" ; case "$(JJB_VERSION)" in 1.*) JJB_OUTOPT="" ;; *) JJB_OUTOPT="--config-xml" ;; esac  ; \
	LC_ALL=C jenkins-jobs  $(JJB_CONFIG)  test -o $(OUTPUT)/$(JJB_JOBS) $$JJB_OUTOPT $(JJB_JOBS)

update: test
	LC_ALL=C jenkins-jobs $(JJB_CONFIG) $(JJB_ARGS) update $(JJB_JOBS)

clean:
	-if [ -d "$(OUTPUT)/$(JJB_JOBS)" ] ; then rm -rf $(OUTPUT)/$(JJB_JOBS) ; fi
	-if [ -d "$(OUTPUT)" ] ; then rm -rf $(OUTPUT) ; fi

