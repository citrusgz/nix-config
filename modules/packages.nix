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

    hyfetch
    vim
    vesktop
    flameshot
    fastfetch
    tree
    lolcat
    vscode
    telegram-desktop
    btop
    htop
    catppuccin-gtk
    papirus-icon-theme
    pfetch
    ufetch
    cmatrix
    onlyoffice-desktopeditors
    anytype
    gimp
    fetch
    bitwarden-desktop
    speedtest-cli
  ];

  programs.firefox.enable = true;

  programs.steam.enable = true;

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  services.printing.enable = true;
  services.flatpak.enable = true;
}
