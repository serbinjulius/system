{ config, ... }:
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
    extraComponents = [ "met" "tuya" "smartthings" ];
  };

  systemd.tmpfiles.rules = [
    "d /data/system/state/hass 0750 hass hass -"
  ];
  systemd.services.home-assistant.unitConfig.RequiresMountsfor = "/data";

  users.users.serbinjulius.extraGroups = [ "hass" ];

  # sops
  sops.secrets.ha_latitude = { };
  sops.secrets.ha_longitude = { };

  sops.templates."hass-secrets.yaml" = {
    owner = "hass";
    restartUnits = [ "home-assistant.service" ];
    path = "/data/system/state/hass/secrets.yaml";
    content = ''
      ha_latitude: ${config.sops.placeholder.ha_latitude}
      ha_longitude: ${config.sops.placeholder.ha_longitude}
    '';
  };
}