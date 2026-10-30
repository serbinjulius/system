{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/ssh.nix
  ];

  networking.hostName = "server";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.serbinjulius = {
    isNormalUser = true;
    group = "serbinjulius";
    extraGroups = [ "wheel"];
  };
  users.groups.serbinjulius = {};

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
  ];

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/6bce5b2b-f507-4b0a-9848-2a5feee4f3e5";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        security = "user";
	"map to guest" = "never";
      };
      data = {
        path = "/data";
	browseable = "yes";
	"read only" = "no";
	"valid users" = "serbinjulius";
	"force user" = "serbinjulius";
      };
    };
  };
}
