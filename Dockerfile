#
# Simple etcdctl client
#
# http://github.com/tenstartups/etcdctl
#

FROM tenstartups/alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  ETCD_VERSION=3.0.6

# Install etcdctl from repository.
RUN \
  cd /tmp && \
  wget https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz && \
  tar zxvf etcd-*-linux-amd64.tar.gz && \
  cp etcd-*-linux-amd64/etcdctl /usr/local/bin/etcdctl && \
  rm -rf etcd-*-linux-amd64 && \
  chmod +x /usr/local/bin/etcdctl

# Add files to the container.
COPY entrypoint.sh /docker-entrypoint
COPY etcd2env.sh /usr/local/bin/etcd2env

# Set the entrypoint script.
ENTRYPOINT ["/docker-entrypoint"]
