FROM fedora:43

RUN dnf -y install \
    rpm-ostree \
    git \
    python3 \
    && dnf clean all

WORKDIR /srv/build

# We will mount the working directory here
