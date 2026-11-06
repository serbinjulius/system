{ config, lib, pkgs, ... }:
{
  # open_gl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # driver for xorg and wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

    nvidiaSettings = true;

    open = false;
  };
}
