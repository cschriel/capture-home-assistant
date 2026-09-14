# Checkmate Capture Agent

## Configuration

| Option | Description |
| --- | --- |
| `api_secret` | Required shared secret. Use the same value in Checkmate's Infrastructure server settings. |
| `port` | Internal Capture API port. Default: `59232`. |
| `gin_mode` | Capture runtime mode. Use `release` for normal operation. |

## Checkmate Setup

After the app starts, add the Home Assistant host in Checkmate Infrastructure with:

- URL: `http://<home-assistant-host>:59232`
- Secret: your configured `api_secret`

## Limitations

Capture's Docker installation does not support S.M.A.R.T. monitoring. Home Assistant Supervisor isolation may also limit access to Docker/container metrics.
