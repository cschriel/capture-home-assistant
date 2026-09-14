FROM ghcr.io/bluewave-labs/capture:latest AS capture

FROM alpine:3.20

ARG BUILD_VERSION
ARG BUILD_ARCH

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

RUN apk add --no-cache ca-certificates

COPY --from=capture /capture /usr/local/bin/capture
COPY run.sh /

RUN chmod a+x /run.sh /usr/local/bin/capture

CMD ["/run.sh"]
