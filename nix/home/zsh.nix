{ config, pkgs, ...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = false;

    initContent = builtins.readFile ../../configs/zsh/zshrc;
  };
}