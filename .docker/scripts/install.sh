#!/bin/bash

BRANCH=${BRANCH:-"release"}

INSTALL_VEHMODS=${INSTALL_VEHMODS:-"true"}
INSTALL_VEHMODELS=${INSTALL_VEHMODELS:-"true"}
INSTALL_CLOTHES=${INSTALL_CLOTHES:-"true"}
INSTALL_PEDMODELS=${INSTALL_PEDMODELS:-"true"}

INSTALL_JS_MODULE=${INSTALL_JS_MODULE:-"true"}
INSTALL_CSHARP_MODULE=${INSTALL_CSHARP_MODULE:-"true"}

LIBNODE_VERSION=${LIBNODE_VERSION:-"102"}

apt-get update
apt-get install -y wget gnupg libatomic1 libc-bin apt-transport-https

# setup default altv-server files
mkdir -p /opt/altv/modules /opt/altv/resources /opt/altv/data
wget --no-cache -q -O /opt/altv/altv-server https://cdn.alt-mp.com/server/${BRANCH}/x64_linux/altv-server
chmod +x /opt/altv/altv-server /root/entrypoint.sh

# setup optional vehicle and clothing data
[ "$INSTALL_VEHMODS" = "true" ] && wget --no-cache -q -O /opt/altv/data/vehmodels.bin https://cdn.alt-mp.com/data/${BRANCH}/data/vehmodels.bin
[ "$INSTALL_VEHMODELS" = "true" ] && wget --no-cache -q -O /opt/altv/data/vehmods.bin https://cdn.alt-mp.com/data/${BRANCH}/data/vehmods.bin
[ "$INSTALL_CLOTHES" = "true" ] && wget --no-cache -q -O /opt/altv/data/clothes.bin https://cdn.alt-mp.com/data/${BRANCH}/data/clothes.bin
[ "$INSTALL_PEDMODELS" = "true" ] && wget --no-cache -q -O /opt/altv/data/pedmodels.bin https://cdn.alt-mp.com/data/${BRANCH}/data/pedmodels.bin

# setup optional js module
if [ "$INSTALL_JS_MODULE" = "true" ]; then
    mkdir -p /opt/altv/modules/js-module/
    wget --no-cache -q -O /opt/altv/modules/js-module/libnode.so.${LIBNODE_VERSION} https://cdn.alt-mp.com/js-module/${BRANCH}/x64_linux/modules/js-module/libnode.so.${LIBNODE_VERSION}
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-module.so https://cdn.alt-mp.com/js-module/${BRANCH}/x64_linux/modules/js-module/libjs-module.so
    wget --no-cache -q -O /opt/altv/modules/js-module/libjs-bytecode-module.so https://cdn.alt-mp.com/js-bytecode-module/${BRANCH}/x64_linux/modules/libjs-bytecode-module.so
fi

# setup optional csharp module
if [ "$INSTALL_CSHARP_MODULE" = "true" ]; then
    wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    dpkg -i packages-microsoft-prod.deb
    rm -f packages-microsoft-prod.deb
    apt-get update
    apt-get install dotnet-runtime-6.0 -y
    # install altV module
    wget --no-cache -q -O /opt/altv/modules/libcsharp-module.so https://cdn.alt-mp.com/coreclr-module/${BRANCH}/x64_linux/modules/libcsharp-module.so
    mkdir -p /usr/share/dotnet/host/fxr/
    wget --no-cache -q -O /opt/altv/AltV.Net.Host.dll https://cdn.alt-mp.com/coreclr-module/${BRANCH}/x64_linux/AltV.Net.Host.dll
    cat <<EOF >/opt/altv/AltV.Net.Host.runtimeconfig.json
{
  "runtimeOptions": {
    "tfm": "net6",
    "framework": {
      "name": "Microsoft.NETCore.App",
      "version": "6.0.0"
    }
  }
}
EOF
fi

# cleanup not needed packages
apt-get purge -y wget gnupg apt-transport-https
apt autoremove -y
apt-get clean
