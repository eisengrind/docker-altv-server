
ARG BUILD=""

FROM eisengrind/altv-server:${BUILD}

ARG BRANCH="release"

RUN apt-get install -y wget jq && \
    mkdir -p /opt/altv/modules/js-module/ && \
    LIBNODE_NAME="libnode.so.72" && \
    if [ "$BRANCH" = "rc" ]; then LIBNODE_NAME="libnode.so"; fi && \
    wget --no-cache -q -O /opt/altv/modules/js-module/${LIBNODE_NAME} https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/${LIBNODE_NAME} && \
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-module.so https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so && \
    apt-get purge -y wget jq && \
    apt-get clean

ENV ALTV_SERVER_MODULES='csharp-module,js-module'
