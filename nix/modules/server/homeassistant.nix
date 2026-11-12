{ ... }:
{
  services.home-assistant = {
    enable = true;
    configDir = "/data/system/state/hass";
    config = {
      default_config = { };
      homeassistant = {
        name = "Home";
      };
    };
  };

  systemd.tmpfiles.rules = [
    "d /data/system/state/hass 0750 hass hass -"
  ];
  systemd.services.home-assistant.unitConfig.RequiresMountsfor = "/data";

  users.users.serbinjulius.extraGroups = [ "hass" ];
}