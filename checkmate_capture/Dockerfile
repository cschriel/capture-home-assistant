FROM alpine:3.20

ARG BUILD_VERSION
ARG BUILD_ARCH
ARG CAPTURE_VERSION=1.4.0

LABEL \
  io.hass.version="${BUILD_VERSION}" \
  io.hass.type="app" \
  io.hass.arch="${BUILD_ARCH}"

RUN apk add --no-cache ca-certificates tar wget

RUN set -eu; \
  case "${BUILD_ARCH}" in \
    amd64) CAPTURE_ARCH="amd64" ;; \
    aarch64) CAPTURE_ARCH="arm64" ;; \
    *) echo "Unsupported Home Assistant architecture: ${BUILD_ARCH}" >&2; exit 1 ;; \
  esac; \
  wget -O /tmp/capture.tar.gz "https://github.com/bluewave-labs/capture/releases/download/v${CAPTURE_VERSION}/capture_${CAPTURE_VERSION}_linux_${CAPTURE_ARCH}.tar.gz"; \
  mkdir -p /tmp/capture; \
  tar -xzf /tmp/capture.tar.gz -C /tmp/capture; \
  find /tmp/capture -type f -name capture -exec cp {} /usr/local/bin/capture \; -quit; \
  test -f /usr/local/bin/capture; \
  chmod a+x /usr/local/bin/capture; \
  rm -rf /tmp/capture /tmp/capture.tar.gz

COPY run.sh /

RUN chmod a+x /run.sh /usr/local/bin/capture

CMD ["/run.sh"]
