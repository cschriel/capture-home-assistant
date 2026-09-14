# Checkmate Capture Agent for Home Assistant

This repository packages the Checkmate Capture infrastructure monitoring agent as a Home Assistant OS app/add-on.

Capture exposes host metrics on port `59232` so Checkmate can monitor the Home Assistant host.

## Install

1. In Home Assistant, go to **Settings > Add-ons > Add-on Store**.
2. Open the menu, choose **Repositories**, and add this repository URL.
3. Install **Checkmate Capture Agent**.
4. Set `api_secret` to the same secret you will enter in Checkmate.
5. Start the app.

## Connect Checkmate

In Checkmate, open **Infrastructure**, add a server, and use:

- Address: `http://<home-assistant-host>:59232`
- Secret: the `api_secret` configured in this app

## Notes

- S.M.A.R.T. disk health is not expected to work from the Docker-based Home Assistant app because Capture's own docs note that S.M.A.R.T. monitoring is not supported in Docker installs.
- Docker container monitoring from inside Home Assistant OS may be limited by Supervisor isolation.
