{ config, pkgs, ... }:
{
  home.stateVersion = "26.05";

  home.file.".config/sway".source = ../../configs/sway;

  home.packages = with pkgs; [
    zsh
    starship
  ];

  home.file.".zshrc".source = ../../configs/zsh/zshrc;
  home.file.".config/starship.toml".source = ../../configs/zsh/starship.toml;
}
