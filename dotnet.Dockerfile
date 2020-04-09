
ARG BUILD=""

FROM eisengrind/altv-server:${BUILD}

ARG BRANCH="release"

RUN apt-get install -y wget gnupg && \
# install dotnet 3.1 runtime
    wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
    wget https://packages.microsoft.com/config/debian/10/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
    apt-get update && \
    apt-get -y install apt-transport-https dotnet-runtime-3.1 && \
#
    wget --no-cache -q -O /opt/altv/modules/libcsharp-module.so https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/modules/libcsharp-module.so && \
    mkdir -p /usr/share/dotnet/host/fxr/ && \
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.dll https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.dll && \
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.runtimeconfig.json https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.runtimeconfig.json && \
#
    apt-get purge -y wget gnupg && \
    apt-get clean

ENV ALTV_SERVER_MODULES='"csharp-module"'
ENV LD_LIBRARY_PATH=/opt/altv/
