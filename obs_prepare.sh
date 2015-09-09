#!/bin/bash

function install_obs_client {
        sudo add-apt-repository "deb http://download.opensuse.org/repositories/openSUSE:/Tools/x${TEST_OS}_${TEST_OS_VERSION}/ /"
        wget -qO - "http://download.opensuse.org/repositories/openSUSE:Tools/x${TEST_OS}_${TEST_OS_VERSION}/Release.key" | sudo apt-key add -
        sudo apt-get update -qq
        echo -e "" | sudo apt-get install osc
}

function create_source_package {
        dpkg-buildpackage -S || true
}

function prepare_project {
        echo -e "[general]\napiurl = https://api.opensuse.org\n[https://api.opensuse.org]\nuser = ${OBS_USERNAME}\npass = ${OBS_PASSWORD}\n" > ~/.oscrc
        osc co ${OBS_HOME}:${OBS_PROJECT}:${OBS_MAJOR_VERSION}:${OBS_MINOR_VERSION}:${OBS_MAINTENANCE_VERSION}/${OBS_PACKAGE}
        rm -f ${OBS_PROJECT_DIR}/*
}

function update_source_in_project {
        mv ../${OBS_PACKAGE}*.tar.gz ${OBS_PROJECT_DIR}
}
function update_deb_in_project {
        mv ../${OBS_PACKAGE}*.dsc ${OBS_PROJECT_DIR}
}

function update_rpm_in_project {
        if [ -d "rpm" ]; then
                mv rpm/${OBS_PACKAGE}* ${OBS_PROJECT_DIR}
        fi
}

create_source_package
install_obs_client
prepare_project
update_source_in_project
update_deb_in_project
update_rpm_in_project
