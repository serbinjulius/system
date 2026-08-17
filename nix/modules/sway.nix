{ config, pkgs, ... }:
{
  programs.sway.enable = true;
  
  security.polkit.enable = true;
}
