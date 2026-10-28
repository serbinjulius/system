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
}
