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
    firefox
    flameshot
    gimp
    hping
    htop
    hyfetch
    kdePackages.kcalc
    lolcat
    nodejs
    nmap
    opencode
    onlyoffice-desktopeditors
    psmisc
    python3
    rclone
    speedtest-cli
    telegram-desktop
    tree
    vesktop
    vscode
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  
  programs.nix-ld.enable = true;
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
  programs.steam.enable = true;
  programs.vim.enable = true;
}
