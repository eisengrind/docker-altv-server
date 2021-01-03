
FROM debian:buster-slim

ARG BRANCH=release

COPY ./.docker/scripts/entrypoint.sh /root/

RUN apt-get update && \
    apt-get install -y wget libatomic1 libc-bin && \
    mkdir -p /opt/altv/modules && \
    mkdir -p /opt/altv/resources && \
    mkdir -p /opt/altv/data && \
    wget --no-cache -q -O /opt/altv/altv-server https://cdn.altv.mp/server/${BRANCH}/x64_linux/altv-server && \
    wget --no-cache -q -O /opt/altv/data/vehmodels.bin https://cdn.altv.mp/server/${BRANCH}/x64_linux/data/vehmodels.bin && \
    wget --no-cache -q -O /opt/altv/data/vehmods.bin https://cdn.altv.mp/server/${BRANCH}/x64_linux/data/vehmods.bin && \
    chmod +x /opt/altv/altv-server /root/entrypoint.sh && \
    apt-get purge -y wget && \
    apt autoremove -y && \
    apt-get clean

######
# Install JS Module
######
RUN apt-get install -y wget jq && \
    mkdir -p /opt/altv/modules/js-module/ && \
    wget --no-cache -q -O /opt/altv/modules/js-module/libnode.so.72 https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libnode.so.72 && \
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-module.so https://cdn.altv.mp/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so && \
    apt-get purge -y wget jq && \
    apt autoremove -y && \
    apt-get clean

######
# Install .NET (3.1 and 5) Module
######
RUN apt-get install -y wget gnupg && \
    # install dotnet runtime(s)
    wget -O- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
    mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
    wget https://packages.microsoft.com/config/debian/10/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
    chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
    apt-get update && \
    apt-get -y install apt-transport-https dotnet-runtime-3.1 dotnet-runtime-5.0 && \
    # install altV module
    wget --no-cache -q -O /opt/altv/modules/libcsharp-module.so https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/modules/libcsharp-module.so && \
    mkdir -p /usr/share/dotnet/host/fxr/ && \
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.dll https://cdn.altv.mp/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.dll && \
    # remove unused tools
    apt-get purge -y wget gnupg && \
    apt autoremove -y && \
    apt-get clean

WORKDIR /opt/altv/

# Meant are the default values provided by the entrypoint script.
# Of course you can change the port as you like by using the
# environment variable "ALTV_SERVER_PORT".
EXPOSE 7788/udp
EXPOSE 7788/tcp

ENTRYPOINT [ "/root/entrypoint.sh" ]
