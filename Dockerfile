FROM ubuntu
MAINTAINER McKay Software <opensource@mckaysoftware.co.nz>

VOLUME /etc/salt/master.d
VOLUME /etc/salt/pki
VOLUME /srv/salt
VOLUME /var/cache/salt
VOLUME /var/logs/salt

EXPOSE 4505 4506

ENTRYPOINT ["/usr/bin/salt-master"]
CMD ["--log-level=error"]

RUN export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update && apt-get install -y software-properties-common dmidecode &&\
    add-apt-repository -y ppa:saltstack/salt &&\
    apt-get update && apt-get install -y salt-master &&\
    apt-get autoremove -y && apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

