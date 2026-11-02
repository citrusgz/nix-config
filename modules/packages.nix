{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };

  environment.systemPackages = with pkgs; [
    anytype
    appimage-run
    aria2
    bitwarden-desktop
    bluez
    btop
    cowsay
    devenv
    fastfetch
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
    # OnlyOffice still lists gtk2 as a build input upstream, but its output
    # only links against gtk3. Substitute gtk3 so we don't pull in the
    # now-broken gtk2 package (see NixOS/nixpkgs#410814).
    (onlyoffice-desktopeditors.override { gtk2 = gtk3; })
    opencode
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
    inputs.fetch.packages.${system}.default
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
