{ config, pkgs, ... }:
{
  programs.sway.enable = true;
  
  security.polkit.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
