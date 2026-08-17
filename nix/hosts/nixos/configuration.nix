{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  
  networking.hostName = "nixos";
  system.stateVersion = "26.05";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  users.users.serbinjulius = {
    isNormalUser = true;
    group = "serbinjulius";
    extraGroups = [ "wheel" ];
  };
  users.groups.serbinjulius = {};
}

