{ ... }:
{
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers.minecraft = {
    image = "itzg/minecraft-server:latest";
    ports = [ "25565:25565" ];
    volumes = [ "/data/games/minecraft:/data" ];
    environment = {
      EULA = "TRUE";
      TYPE = "FABRIC";
      VERSION = "1.21.11";
      MEMORY = "4G";
      ONLINE_MODE = "FALSE";
      MODRINTH_PROJECTS = "fabric-api, lithium, spark";
      UID = "1000";
      GID = "1000";
    };
  };

  systemd.services.docker-minecraft.unitConfig.RequiresMountFor = "/data";
}