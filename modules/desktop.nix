{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  security.polkit.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  console.keyMap = "br-abnt2";

}
