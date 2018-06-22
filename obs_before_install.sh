#!/bin/bash

function add_build_dependency_source {
	apt-get update -qq
	apt-get install -qq -y --no-install-recommends wget
	wget -q -O - "https://download.opensuse.org/repositories/${OBS_PROJECT_URL}/xUbuntu_18.04/Release.key" | apt-key add -
	echo "deb [trusted=yes] https://download.opensuse.org/repositories/${OBS_PROJECT_URL}/xUbuntu_18.04/ /" >/etc/apt/sources.list.d/zorp.list
	apt-get update -qq
	apt-get purge -qq -y wget
}

add_build_dependency_source
