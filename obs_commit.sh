#!/bin/bash

function commit_project {
        osc addremove ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR}
        osc commit -m "Commited by CircleCI build ${CIRCLE_BUILD_NUM}" ${CIRCLE_WORKING_DIRECTORY}/${OBS_PROJECT_DIR}
}

commit_project
