{ ... }:
{
  virtualisation.oci-containers.backend = "docker";

  virtualisation.oci-containers.containers.minecraft = {
    image = "itzg/minecraft-server:latest";
    ports = [ "25565:25565" "19132:19132" "8100:8100" "19132:19132/udp" ];
    volumes = [ "/data/games/minecraft:/data" ];
    environment = {
      EULA = "TRUE";
      VERSION = "26.3";
      TYPE = "PAPER";
      MEMORY = "4G";
      PLUGINS = ''
        https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot
        https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot
      '';
      MODRINTH_PROJECTS = ''
        luckperms
	taerra
	enhancedsurvival
      '';
      ONLINE_MODE = "FALSE";
      UID = "1000";
      GID = "1000";
      SEED = "-1718501946501227358";
    };
  };

  systemd.services.docker-minecraft.unitConfig.RequiresMountFor = "/data";
}