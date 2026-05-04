{ lib }:
pkg:
builtins.elem (lib.getName pkg) [
  "claude-code"
  "discord"
  "nvidia-settings"
  "nvidia-x11"
  "spotify"
]
