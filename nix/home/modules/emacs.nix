{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: [
      epkgs.vterm
    ];
  };

  xdg.configFile."emacs/init.el".source = ../../../configs/emacs/init.el;
}
