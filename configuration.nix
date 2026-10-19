{ ... }:

{
  imports = [
    ./modules/core.nix
    ./modules/desktop.nix
    ./modules/flatpak.nix
    ./modules/audio.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/spicetify.nix
    ./modules/home-manager.nix
  ];

  environment.pathsToLink = [ "/share/bash-completion" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.stateVersion = "26.05";
}
