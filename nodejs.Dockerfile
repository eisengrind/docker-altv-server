
ARG BRANCH="release"
ARG BUILD=""

FROM eisengrind/altv-server:${BUILD}

ARG BRANCH="release"
ARG BUILD=""

RUN apt-get install -y wget && \
    wget --no-cache -q -O /opt/altv/modules/libnode-module.so https://cdn.altv.mp/node-module/${BRANCH}/x64_linux/modules/libnode-module.so?salt=${BUILD} && \
    wget --no-cache -q -O /opt/altv/libnode.so.72 https://cdn.altv.mp/node-module/${BRANCH}/x64_linux/libnode.so.72?salt=${BUILD} && \
    apt-get purge -y wget && \
    apt-get clean

ENV ALTV_SERVER_MODULES='"node-module"'
ENV LD_LIBRARY_PATH=/opt/altv/
