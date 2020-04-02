FROM docker

VOLUME [ "/var/run/docker.sock", "/var/run/docker.sock" ]

ADD scripts/mic-rotate-auth.sh /
ADD scripts/project-build.sh /
