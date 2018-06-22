#!/bin/bash

function create_source_package {
        dpkg-buildpackage -S
}

function prepare_project {
        echo -e "[general]\napiurl = https://api.opensuse.org\n[https://api.opensuse.org]\nuser = ${OBS_USERNAME}\npass = ${OBS_PASSWORD}\n" > ~/.oscrc
        mkdir -p ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR}
        osc co -o ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR} ${OBS_PROJECT_DIR}
        rm -rf ${OBS_PROJECT_DIR}/*
}

function update_source_in_project {
        mv ../${PACKAGE}*.tar.* ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR}
}
function update_deb_in_project {
        mv ../${PACKAGE}*.dsc ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR}
}

function update_rpm_in_project {
        if [ -d "rpm" ]; then
                mv rpm/${PACKAGE}* ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR}
        fi
}

create_source_package
prepare_project
update_source_in_project
update_deb_in_project
update_rpm_in_project
