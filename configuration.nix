{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/core.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/spicetify.nix
    ./modules/home-manager.nix
  ];

  system.stateVersion = "26.05";
}
