FROM golang:latest AS configurator

WORKDIR /usr/src/app/

COPY ./tools/configurator ./
RUN go mod download && go mod verify

COPY ./tools/configurator ./
RUN go build -o /usr/src/app/configurator -ldflags "-s -w" -v ./main.go



FROM ubuntu:focal AS final

ARG BRANCH=release
ARG LIBNODE_VERSION=102

ARG INSTALL_VEHMODS=true
ARG INSTALL_VEHMODELS=true
ARG INSTALL_CLOTHES=true
ARG INSTALL_JS_MODULE=true
ARG INSTALL_CSHARP_MODULE=true

ENV ALTV_SERVER_MODULES="csharp-module,js-module"

COPY ./.docker/scripts/install.sh ./.docker/scripts/entrypoint.sh /root/
COPY --from=configurator /usr/src/app/configurator /opt/altv/configurator

RUN chmod +x /root/install.sh && \
    chmod +x /opt/altv/configurator && \
    /root/install.sh && \
    rm -f /root/install.sh

WORKDIR /opt/altv/

# Meant are the default values provided by the entrypoint script.
# Of course you can change the port as you like by using the
# environment variable "ALTV_SERVER_PORT".
EXPOSE 7788/udp
EXPOSE 7788/tcp

ENTRYPOINT [ "/root/entrypoint.sh" ]
