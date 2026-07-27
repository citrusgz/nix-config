{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/core.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/home.nix
    ./modules/spicetify.nix
  ];

  system.stateVersion = "26.05";
}
