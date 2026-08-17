{ config, pkgs, ...}:
{
  services.keyd.enable = true;

  environment.etc."keyd/default.conf".source = ../../configs/keyd/default.conf;

}
