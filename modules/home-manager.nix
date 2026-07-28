{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.citrus = { ... }: {
    home.stateVersion = "26.05";

    programs.git = {
      enable = true;
      userName = "citrusgz";
      userEmail = "29004858+citrusgz@users.noreply.github.com";
    };
  };
}
