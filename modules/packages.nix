{ pkgs, ... }:

{

  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    psmisc
    apple-cursor
    bluez    
  ];

  services.printing.enable = true;
  services.flatpak.enable = true;
}
