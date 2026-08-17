{ config, pkgs, ... }:
{

  imports = [
    ./hardware-configuration.nix 
    ../../modules/keyd.nix
    ../../modules/sway.nix
    ../../modules/fonts.nix
  ];
  
  networking.hostName = "nixos";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable =true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.serbinjulius = {
    isNormalUser = true;
    group = "serbinjulius";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
  users.groups.serbinjulius = {};

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs;  [
    nh
  ];

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
