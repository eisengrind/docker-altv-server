
ARG BUILD=""

FROM eisengrind/altv-server:${BUILD}

ARG BRANCH="release"

RUN apt-get install -y wget jq && \
    NODE_LIB_NAME=$(wget --no-cache -qO- https://cdn.altv.mp/node-module/${BRANCH}/x64_linux/update.json | grep -E -o 'libnode\.so\.[0-9]+') && \
    wget --no-cache -q -O /opt/altv/modules/libnode-module.so https://cdn.altv.mp/node-module/${BRANCH}/x64_linux/modules/libnode-module.so && \
    wget --no-cache -q -O /opt/altv/libnode.so.72 https://cdn.altv.mp/node-module/${BRANCH}/x64_linux/$NODE_LIB_NAME && \
    apt-get purge -y wget jq && \
    apt-get clean

ENV ALTV_SERVER_MODULES='"node-module"'
ENV LD_LIBRARY_PATH=/opt/altv/
