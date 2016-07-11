FROM tcpcloud/k8s-base

RUN apt-get install kubernetes-node -y

# Cleanup
RUN apt-get autoremove --purge -y
RUN apt-get clean
