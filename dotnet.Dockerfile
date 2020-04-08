
ARG BRANCH="release"
ARG BUILD=""

FROM eisengrind/altv-server:${BRANCH}-${BUILD}

ARG BRANCH="release"
ARG BUILD=""
ARG DOTNET_VERSION="1.28.42"

RUN apt-get install -y wget gnupg && \
#
    wget --no-cache -q -O /opt/altv/modules/libcsharp-module.so https://github.com/FabianTerhorst/coreclr-module/releases/download/${DOTNET_VERSION}/libcsharp-module.so && \
    mkdir -p /usr/share/dotnet/host/fxr/ && \
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.dll https://github.com/FabianTerhorst/coreclr-module/releases/download/${DOTNET_VERSION}/AltV.Net.Host.dll && \
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.runtimeconfig.json https://github.com/FabianTerhorst/coreclr-module/releases/download/${DOTNET_VERSION}/AltV.Net.Host.runtimeconfig.json && \
#
    wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
    wget https://packages.microsoft.com/config/debian/10/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
    apt-get update && \
    apt-get -y install apt-transport-https dotnet-runtime-3.1 && \
#
    apt-get purge -y wget gnupg && \
    apt-get clean

ENV ALTV_SERVER_MODULES='"csharp-module"'
ENV LD_LIBRARY_PATH=/opt/altv/
