{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.citrus = { config, pkgs, ... }: {
    home.stateVersion = "26.05";

    programs.git = {
      enable = true;
      settings = {
        user.name = "citrusgz";
        user.email = "29004858+citrusgz@users.noreply.github.com";
        credential.helper = "store";
      };
    };
    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        garbage = "sudo nix-collect-garbage -d";
        update = "sudo nix flake update";
        rebuild = "sudo nixos-rebuild switch --flake ~/nix-config#nixos";
      };
      historySize = 10000;
      initExtra = ''
        source ${pkgs.blesh}/share/blesh/ble.sh
      '';
    };
    home.packages = with pkgs; [
      blesh
      nix-bash-completions
    ];
  };
}
