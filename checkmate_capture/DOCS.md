# Checkmate Capture Agent

This add-on packages Checkmate Capture for Home Assistant OS. It was built for personal use on an Odroid Home Assistant Blue and has not been tested anywhere else. That is not a dare, but Home Assistant people do enjoy a project.

During the add-on build, the Dockerfile downloads the official Checkmate Capture Linux release archive and installs the binary matching the Home Assistant architecture.

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

This is an as-is personal-use repository, not an official Checkmate or Home Assistant integration.

Improvements are welcome, especially reports from hardware that is not an Odroid Home Assistant Blue.

Capture's Docker installation does not support S.M.A.R.T. monitoring.

Network monitoring does not show real host traffic. Capture runs inside the add-on container and can only see that container's network namespace, not the Home Assistant OS host interfaces.

Home Assistant Supervisor isolation may also limit access to Docker/container metrics.
