{ config, pkgs, ... }:
{
	services.tailscale.enable = true;
	services.netbird.enable = true;
}
