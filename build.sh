#!/bin/bash

function prepare_build {
        DEBIAN_FRONTEND=noninteractive apt-get update
        mk-build-deps -i -r -t " apt-get --yes"
}

function do_build {
        autoreconf -if
        ./configure --prefix=$HOME
	make
}

function test_build {
	make check
}

prepare_build
do_build
test_build
