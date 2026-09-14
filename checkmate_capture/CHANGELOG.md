# Changelog

## 0.1.7

- Publish pre-built GHCR images with the Home Assistant builder workflow.
- Configure the add-on to install from the signed public multi-architecture image.

## 0.1.6

- Add a custom AppArmor profile to improve the Home Assistant security rating.
- Mount the add-on config directory read-only.

## 0.1.5

- Document that network monitoring only sees the add-on container namespace, not real host traffic.

## 0.1.4

- Remove Docker API access to keep the Home Assistant add-on warning-free.

## 0.1.3

- Enable Home Assistant Docker API access so Capture can try to discover Supervisor-managed containers.

## 0.1.2

- Install Capture from the official Linux release archive instead of copying from the shell-less upstream image.

## 0.1.1

- Fix Home Assistant build by running the wrapper in an Alpine image and copying in the upstream Capture binary.

## 0.1.0

- Initial Home Assistant app packaging for the Checkmate Capture agent.
