#!/usr/bin/env ruby
# frozen_string_literal: true

capture_version = ARGV.fetch(0).delete_prefix("v")

dockerfile_path = "checkmate_capture/Dockerfile"
config_path = "checkmate_capture/config.yaml"
changelog_path = "checkmate_capture/CHANGELOG.md"

dockerfile = File.read(dockerfile_path)
current_capture_version = dockerfile[/^ARG CAPTURE_VERSION=(.+)$/, 1]

abort "Could not find CAPTURE_VERSION in #{dockerfile_path}" unless current_capture_version

if current_capture_version == capture_version
  puts "Capture is already pinned to #{capture_version}."
  exit 0
end

config = File.read(config_path)
addon_version = config[/^version: ([0-9]+)\.([0-9]+)\.([0-9]+)$/, 0]
major = Regexp.last_match(1)
minor = Regexp.last_match(2)
patch = Regexp.last_match(3)

abort "Could not find add-on version in #{config_path}" unless addon_version

new_addon_version = "#{major}.#{minor}.#{patch.to_i + 1}"

dockerfile.sub!(
  /^ARG CAPTURE_VERSION=.+$/,
  "ARG CAPTURE_VERSION=#{capture_version}"
)
File.write(dockerfile_path, dockerfile)

config.sub!(
  /^version: .+$/,
  "version: #{new_addon_version}"
)
File.write(config_path, config)

changelog = File.read(changelog_path)
entry = <<~MARKDOWN
  ## #{new_addon_version}

  - Update Checkmate Capture to #{capture_version}.

MARKDOWN

changelog.sub!(/^# Changelog\n\n/, "# Changelog\n\n#{entry}")
File.write(changelog_path, changelog)

puts "Updated Capture #{current_capture_version} -> #{capture_version}."
puts "Bumped add-on #{addon_version.delete_prefix("version: ")} -> #{new_addon_version}."
