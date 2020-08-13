
ARG BUILD=""

FROM eisengrind/altv-server:${BUILD}

ARG BRANCH="release"

RUN apt-get install -y wget jq && \
    mkdir -p /opt/altv/modules/js-module/ && \
    wget --no-cache -q -O /opt/altv/modules/js-module/libnode.so.72 https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libnode.so.72 && \
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-module.so https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so && \
    apt-get purge -y wget jq && \
    apt-get clean

ENV ALTV_SERVER_MODULES='js-module'
ENV LD_LIBRARY_PATH=/opt/altv/modules/js-module/
