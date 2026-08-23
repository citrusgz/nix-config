{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager.plasma-login-manager.enable = true;
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
