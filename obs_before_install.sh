#!/bin/bash

function add_build_dependency_source {
	wget -q -O /dev/null http://download.opensuse.org/repositories/${OBS_HOME}:/${OBS_PROJECT}:/${OBS_MAJOR_VERSION}:/${OBS_MINOR_VERSION}:/${OBS_MAINTENANCE_VERSION}/x${TEST_OS}_${TEST_OS_VERSION}/Release.key || return 0
	sudo add-apt-repository "deb http://download.opensuse.org/repositories/${OBS_HOME}:/${OBS_PROJECT}:/${OBS_MAJOR_VERSION}:/${OBS_MINOR_VERSION}:/${OBS_MAINTENANCE_VERSION}/x${TEST_OS}_${TEST_OS_VERSION}/ ./"
	wget -qO - http://download.opensuse.org/repositories/${OBS_HOME}:/${OBS_PROJECT}:/${OBS_MAJOR_VERSION}:/${OBS_MINOR_VERSION}:/${OBS_MAINTENANCE_VERSION}/x${TEST_OS}_${TEST_OS_VERSION}/Release.key | sudo apt-key add -
	sudo apt-get update -qq
}

add_build_dependency_source
