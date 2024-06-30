{ pkgs, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "offeex" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
