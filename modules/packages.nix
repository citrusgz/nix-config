{ pkgs, inputs, ... }:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };

  environment.systemPackages = with pkgs; [
    anytype
    appimage-run
    bitwarden-desktop
    bluez
    btop
    cowsay
    fastfetch
    fetch
    flameshot
    gimp
    hping
    hyfetch
    kdePackages.kcalc
    lolcat
    nextcloud-client
    nodejs
    nmap
    onlyoffice-desktopeditors
    psmisc
    python3
    rclone
    speedtest-cli
    telegram-desktop
    tree
    vesktop
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  
  programs.firefox.enable = true;
  programs.htop.enable = true;
  programs.nix-ld.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
  programs.steam.enable = true;
  programs.vim.enable = true;
  programs.vscode = {
  enable = true;
  package = pkgs.vscode;
    extensions = [
      inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace.bbenoist.nix
    ];
  };
}
