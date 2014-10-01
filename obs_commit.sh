#!/bin/bash

function commit_project {
        cd ${OBS_PROJECT_DIR}
        osc addremove
        osc commit -m "Commited by Travis CI from build number $TRAVIS_BUILD_NUMBER"
}

commit_project
