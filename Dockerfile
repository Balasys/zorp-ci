FROM ubuntu:19.10

MAINTAINER Szilárd Pfeiffer "szilard.pfeiffer@balasys.hu"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get  update \
 && apt-get install -y --no-install-recommends git-core openssh-client \
 && apt-get install -y --no-install-recommends build-essential ca-certificates \
 && apt-get install -y --no-install-recommends g++-8 automake autoconf autoconf-archive libtool \
 && apt-get install -y --no-install-recommends devscripts equivs \
 && apt-get install -y --no-install-recommends gpg-agent gnupg2
 
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8

RUN apt-get install -y --no-install-recommends wget \
 && wget -q -O - "http://download.opensuse.org/repositories/openSUSE:Tools/xUbuntu_19.10/Release.key" | apt-key add - \
 && echo "deb [trusted=yes] http://download.opensuse.org/repositories/openSUSE:/Tools/xUbuntu_19.10/ /" >/etc/apt/sources.list.d/obs.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends osc \
 && apt-get purge -y wget

RUN apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/tmp/* \
 && rm -rf /tmp/*
