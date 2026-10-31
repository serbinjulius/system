{ ... }:
{
  virtualisation.docker.enable=true;
  users.users.serbinjulius.extraGroups = [ "docker" ];
}