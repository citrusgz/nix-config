{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    psmisc
    apple-cursor
    bluez
    #blueman
    #xfce4-clipman-plugin    
  ];

  services.printing.enable = true;
  services.flatpak.enable = true;
}
