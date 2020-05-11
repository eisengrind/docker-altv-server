
FROM debian:buster-slim

ARG BRANCH=release

COPY ./.docker/scripts/entrypoint.sh /root/

RUN apt-get update && \
    apt-get install -y wget libatomic1 libc-bin && \
#
    mkdir -p /opt/altv/modules && \
    mkdir -p /opt/altv/resources && \
    mkdir -p /opt/altv/data && \
#
    wget --no-cache -q -O /opt/altv/altv-server https://cdn.altv.mp/server/${BRANCH}/x64_linux/altv-server && \
# download default vehicle data
    wget --no-cache -q -O /opt/altv/data/vehmodels.bin http://cdn.altv.mp/server/${BRANCH}/x64_linux/data/vehmodels.bin && \
    wget --no-cache -q -O /opt/altv/data/vehmods.bin http://cdn.altv.mp/server/${BRANCH}/x64_linux/data/vehmods.bin && \
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
