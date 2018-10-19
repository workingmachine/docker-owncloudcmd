
FROM ubuntu:18.04

RUN apt-get -y update \
&&  apt-get -y dist-upgrade \
&&  apt-get install -y curl \
      gnupg
RUN sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop:/client-2.4.3/Ubuntu_18.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
RUN curl -o /tmp/Release.key http://download.opensuse.org/repositories/isv:/ownCloud:/desktop:/client-2.4.3/Ubuntu_18.04/Release.key
RUN apt-key add - < /tmp/Release.key
RUN apt-get -y update \
&&  apt-get install -y owncloud-client
RUN apt-get clean \
&&  apt-get -y autoremove --purge \
&&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/owncloud"]
ENTRYPOINT ["/usr/bin/owncloudcmd"]