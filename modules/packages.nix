{ pkgs, inputs, ... }:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-39.8.10"
    ];
  };

  environment.systemPackages = with pkgs; [
    anytype
    bitwarden-desktop
    bluez
    btop
    fastfetch
    fetch
    flameshot
    gimp
    hyfetch
    nextcloud-client
    nodejs
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
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };
  programs.steam.enable = true;
  programs.vim.enable = true;
  programs.vscode.enable = true;
}
