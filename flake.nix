{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./configuration.nix
        inputs.spicetify-nix.nixosModules.spicetify
        {
         hardware.graphics = {
            enable = true;
            enable32Bit = true;
          };
          programs.steam.enable = true;
          programs.firefox.preferences = {
            # disable libadwaita theming for Firefox
            "widget.gtk.libadwaita-colors.enabled" = false;
          };
        } 
      ];
    };
  };
}
