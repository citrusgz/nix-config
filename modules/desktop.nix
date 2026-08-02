{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.tailscale.enable = true;
  services.printing.enable = true;
  services.flatpak.enable = true;

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  security.polkit.enable = true;

  console.keyMap = "br-abnt2";
}
