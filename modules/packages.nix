{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  zenPackages = inputs.zen-browser.packages.${system};
  zen-browser-unwrapped = zenPackages.zen-browser-unwrapped.override {
    hash = "sha256-uyBF0+IWVNQP6EElAJLurf0sH8gx7vtQkiJ3PIvcoUk=";
  };
  zenBrowser = zenPackages.zen-browser.override {
    inherit zen-browser-unwrapped;
  };
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
    flameshot
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
    zenBrowser
  ];

  programs.nix-ld.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
  programs.steam.enable = true;
  programs.vim.enable = true;
}
