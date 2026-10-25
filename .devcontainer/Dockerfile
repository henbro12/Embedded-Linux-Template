# Reproducible development/CI toolchain: same Ubuntu release and packages as the GitHub Actions runners.
FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        clang \
        clang-format \
        clang-tidy \
        cmake \
        gcovr \
        gdb \
        git \
        ninja-build \
        openssh-client \
        sudo \
    && rm -rf /var/lib/apt/lists/*

# Ubuntu images ship an 'ubuntu' user (UID 1000); use it so files created in the container are owned by you.
# Passwordless sudo, so packages can be installed in a running container (development only).
RUN echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ubuntu && chmod 0440 /etc/sudoers.d/ubuntu
USER ubuntu
WORKDIR /workspace
