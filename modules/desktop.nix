{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager.plasma-login-manager.enable = true;

  programs.kde-pim.enable = false;

  services.tailscale.enable = true;
  services.printing.enable = true;

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";
}
