{ pkgs, inputs, ... }:

{

  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    psmisc
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
    papirus-icon-theme
    pfetch
    cmatrix
    onlyoffice-desktopeditors
    anytype
    gimp
    fetch
    bitwarden-desktop
    speedtest-cli
    nodejs
    python3
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
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
