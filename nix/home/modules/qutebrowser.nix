{ config, pkgs, ... }:
{
  programs.qutebrowser = {
    enable = true;

    extraConfig = builtins.readFile ../../../configs/qutebrowser/config.py;
  };
}