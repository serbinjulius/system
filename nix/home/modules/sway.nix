{ config, pkgs, ... }:
{
  xdg.configFile."sway".source = ../../../configs/sway;

  wayland.windowManager.sway = {
    enable = true;
    extraConfig = builtins.readFile ../../../configs/sway/config;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}