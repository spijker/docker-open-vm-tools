FROM debian:latest
MAINTAINER it-operations@boerse-go.de

RUN apt-get update -y &&\
    # install open-vm-tools
    apt-get install -y open-vm-tools &&\
    # remove file to get 0 returncode since ifup,... are missing here
    rm /etc/vmware-tools/scripts/vmware/network &&\
    # Cleanup after install
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/bin/vmtoolsd"]
