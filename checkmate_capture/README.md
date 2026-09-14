# Checkmate Capture Agent

Runs the Checkmate Capture agent so Checkmate can collect infrastructure metrics from your Home Assistant host.

This add-on was built for personal use on an Odroid Home Assistant Blue. That is where it has been tested. Everywhere else is technically an adventure, which is a charming word for "you may be debugging this yourself."

Configure `api_secret` before starting the app. This value must match the secret you enter when adding the server in Checkmate.

The Capture API is exposed on port `59232`.

The image is built by downloading the official Checkmate Capture Linux release archive during the Home Assistant add-on build and installing the matching binary for the Home Assistant architecture.

Improvements, fixes, and reports from other Home Assistant setups are welcome.

Use as-is. No promises, no support contract, no commemorative plaque.
