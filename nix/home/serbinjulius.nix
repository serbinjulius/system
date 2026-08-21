{ config, pkgs, ... }:
{
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    zsh
    starship
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
  ];

  home.file.".config/sway".source = ../../configs/sway;

  home.file.".zshrc".source = ../../configs/zsh/zshrc;
  home.file.".config/starship.toml".source = ../../configs/zsh/starship.toml;

  home.file.".config/kitty".source = ../../configs/kitty;
  home.file.".config/colors".source = ../../configs/colors;

  home.file.".ssh/config".source = ../../configs/ssh/config;
  home.file.".ssh/authorized_keys".source = ../../configs/ssh/authorized_keys;
}
