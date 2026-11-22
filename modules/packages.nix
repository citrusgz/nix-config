{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in

{
  environment.systemPackages = with pkgs; [
    anytype
    appimage-run
    aria2
    bitwarden-desktop
    btop
    burpsuite
    cowsay
    devenv
    firefox
    gimp
    hping
    htop
    hyfetch
    kdePackages.kcalc
    lolcat
    ngrok
    nmap
    nodejs
    onlyoffice-desktopeditors
    opencode
    pfetch
    psmisc
    python3
    qbittorrent
    rclone
    speedtest-cli
    telegram-desktop
    tree
    vesktop
    vlc
  ] ++ [
    inputs.zen-browser.packages.${system}.default
  ];

  programs.nix-ld.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
  programs.steam.enable = true;
  programs.vim.enable = true;
}
