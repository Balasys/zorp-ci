#!/bin/bash

function add_build_dependency_source {
	if [ -n "$OBS_PROJECT_URL" ]; then
		wget -q -O - "https://download.opensuse.org/repositories/${OBS_PROJECT_URL}/xUbuntu_19.10/Release.key" | apt-key add -
		echo "deb [trusted=yes] https://download.opensuse.org/repositories/${OBS_PROJECT_URL}/xUbuntu_19.10/ /" >/etc/apt/sources.list.d/zorp.list
		apt-get update -qq
	fi
}

add_build_dependency_source
