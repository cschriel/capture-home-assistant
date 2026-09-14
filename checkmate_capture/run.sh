#!/usr/bin/env sh
set -eu

CONFIG_PATH=/data/options.json

if command -v bashio >/dev/null 2>&1; then
  API_SECRET="$(bashio::config 'api_secret')"
  PORT="$(bashio::config 'port')"
  GIN_MODE="$(bashio::config 'gin_mode')"
else
  API_SECRET="$(sed -n 's/.*"api_secret"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$CONFIG_PATH")"
  PORT="$(sed -n 's/.*"port"[[:space:]]*:[[:space:]]*\([0-9][0-9]*\).*/\1/p' "$CONFIG_PATH")"
  GIN_MODE="$(sed -n 's/.*"gin_mode"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$CONFIG_PATH")"
fi

if [ -z "${API_SECRET:-}" ] || [ "$API_SECRET" = "null" ]; then
  echo "api_secret must be configured before starting Checkmate Capture."
  exit 1
fi

export API_SECRET
export PORT="${PORT:-59232}"
export GIN_MODE="${GIN_MODE:-release}"

echo "Starting Checkmate Capture on port ${PORT}."

if command -v capture >/dev/null 2>&1; then
  exec capture
fi

for binary in /capture /app/capture /usr/local/bin/capture; do
  if [ -x "$binary" ]; then
    exec "$binary"
  fi
done

echo "Could not find the capture binary in the upstream image."
exit 1
