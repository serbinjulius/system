{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;

    extraConfig = builtins.readFile ../../../configs/emacs/init.el;

    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };
}
