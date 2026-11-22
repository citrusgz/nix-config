{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;

  # nixos-unstable currently ships anytype 0.57.4 with a stale node_modules
  # hash for the bun version in the same nixpkgs. Use the hash produced by
  # the current bun; this only applies until upstream updates the package.
  anytype' =
    if pkgs.anytype.version == "0.57.4" then
      pkgs.anytype.overrideAttrs (old: {
        node_modules = old.node_modules.overrideAttrs (_: {
          outputHash = "sha256-/rHV3hmqAGGhp+x56u49+ZYm8YiV4ie0R5FIHlSguz4=";
        });
      })
    else
      pkgs.anytype;
in

{
  environment.systemPackages = with pkgs; [
    anytype'
    appimage-run
    aria2
    bitwarden-desktop
    bluez
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
