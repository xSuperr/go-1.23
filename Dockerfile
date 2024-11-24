FROM        --platform=$TARGETOS/$TARGETARCH golang:1.17-alpine

LABEL       author="xSuperr" maintainer="clashofkansg149@gmail.com"

LABEL       org.opencontainers.image.source="https://https://github.com/xsuperr/go-1.23"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apk add --update --no-cache ca-certificates tzdata \
	&& adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/ash", "/entrypoint.sh" ]
