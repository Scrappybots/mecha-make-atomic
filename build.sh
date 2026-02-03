#!/bin/bash
set -eux

# Build the builder image
docker build -f Dockerfile.builder . -t mecha-builder

# Run the build
# We mount the current directory to /srv/build
# We assume the user has configured the custom repo connectivity or we rely on public internet
# Note: --privileged is often required for rpm-ostree container builds due to bubblewrap/filesystems
docker run --rm --privileged \
    -v $(pwd):/srv/build \
    mecha-builder \
    rpm-ostree compose tree --unified-core --cachedir=cache --repo=repo fedora-atomic.yaml
