# Checkmate Capture Agent for Home Assistant

This repository packages the Checkmate Capture infrastructure monitoring agent as a Home Assistant OS app/add-on.

It exists because I wanted Checkmate to monitor my Home Assistant OS host, specifically an Odroid Home Assistant Blue. It has been tested there, it works there, and that is currently the full QA department. Very enterprise.

This repo is provided as-is for personal use. If it also works on your hardware, excellent. If it turns your add-on store into modern art, you get to keep both pieces.

## How It Works

Home Assistant builds the add-on locally. The Dockerfile starts from Alpine, downloads the official Checkmate Capture Linux release archive, picks the right binary for the Home Assistant architecture, and runs it with a small wrapper script that reads the add-on options.

Supported by the Dockerfile today:

- `aarch64`, tested on Odroid Home Assistant Blue
- `amd64`, included because it is easy and sensible, not because I tested it

Capture exposes its API on port `59232` so Checkmate can monitor the Home Assistant host.

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

- This is a personal-use repo, not an official Checkmate or Home Assistant project.
- The only tested target is Odroid Home Assistant Blue running Home Assistant OS.
- S.M.A.R.T. disk health is not expected to work from the Docker-based Home Assistant app because Capture's own docs note that S.M.A.R.T. monitoring is not supported in Docker installs.
- Docker container monitoring from inside Home Assistant OS may be limited by Supervisor isolation.
