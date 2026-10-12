{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  home-manager.users.citrus = { config, pkgs, ... }: {
    imports = [
      inputs.plasma-manager.homeModules.plasma-manager
      ./plasma.nix
    ];

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
        plasma-sync = "~/nix-config/scripts/plasma-sync";
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
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        github.copilot
        github.copilot-chat
      ];
    };
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
