{ ... }:
{
  virtualisation.docker.enable=true;
  virtualisation.oci-containers.backend = "docker";

  users.users.serbinjulius.extraGroups = [ "docker" ];
}