
FROM debian:buster-slim

ARG BRANCH=release

COPY ./.docker/scripts/entrypoint.sh /root/

RUN apt-get update && \
    apt-get install -y wget libatomic1 libc-bin && \
#
    mkdir -p /opt/altv/modules && \
    mkdir -p /opt/altv/resources && \
#
    wget --no-cache -q -O /opt/altv/altv-server https://cdn.altv.mp/server/${BRANCH}/x64_linux/altv-server && \
#
    chmod +x /opt/altv/altv-server /root/entrypoint.sh && \
#
    apt-get purge -y wget && \
    apt-get clean

WORKDIR /opt/altv/

# Meant are the default values provided by the entrypoint script.
# Of course you can change the port as you like by using the
# environment variable "ALTV_SERVER_PORT".
EXPOSE 7788/udp
EXPOSE 7788/udp

ENTRYPOINT [ "/root/entrypoint.sh" ]
