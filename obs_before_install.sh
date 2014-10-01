#!/bin/bash

function add_build_dependency_source {
	sudo add-apt-repository "deb http://download.opensuse.org/repositories/${OBS_HOME}:/${OBS_PROJECT}:/${OBS_SUBPROJECT}/x${TEST_OS}_${TEST_OS_VERSION}/ ./"
	wget -qO - http://download.opensuse.org/repositories/${OBS_HOME}:/${OBS_PROJECT}:/${OBS_SUBPROJECT}/x${TEST_OS}_${TEST_OS_VERSION}/Release.key | sudo apt-key add -
	sudo apt-get update -qq
}

add_build_dependency_source
