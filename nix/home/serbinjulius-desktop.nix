{ config, pkgs, ... }:
{
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    kitty
    git
    curl
    wget
    tree
    unzip
    zip
    tmux
    htop
    aria2
    wl-clipboard
    bluetui
    freecad
    zathura
    musescore
    vesktop
  ];

  home.file.".config/kitty".source = ../../configs/kitty;
  home.file.".config/colors".source = ../../configs/colors;

  home.file.".ssh/config".source = ../../configs/ssh/config;
}
