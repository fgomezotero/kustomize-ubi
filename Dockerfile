FROM registry.access.redhat.com/ubi8-minimal:8.8-1014

# Install some packages
RUN microdnf install curl ca-certificates wget tar gzip bash \
    && microdnf update \
    && microdnf clean all

# Install kustomize from binaries published at kustomize github release page
RUN curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.1.1/kustomize_v5.1.1_linux_amd64.tar.gz \
    && tar -xzf kustomize*.tar.gz \
    && install -o root -g root -m 0755 kustomize /usr/local/bin/kustomize \
    && rm -rf kustomize*.tar.gz