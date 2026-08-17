{ config, pkgs, ... }:
{
  home.stateVersion = "26.05";

  home.file.".config/sway".source = ../../configs/sway;
}
