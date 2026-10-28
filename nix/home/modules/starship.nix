{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;

    settings = pkgs.lib.importTOML ../../../configs/zsh/starship.toml;
  };
}