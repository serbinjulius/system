{ config, pkgs, ... }:
{

  imports = [
    ./hardware-configuration.nix 
    ../../modules/keyd.nix
  ];
  
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

  fileSystems."/data" = {
    device = "//192.168.0.3/data";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in [
      "credentials=/etc/nixos/smb-secrets"
      "uid=1000" "gid=100"
      automount_opts
    ];
  };

}

