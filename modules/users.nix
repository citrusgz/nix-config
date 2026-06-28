{ pkgs, ... }:

{
  users.users.citrus = {
    isNormalUser = true;
    description = "citrus";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    packages = with pkgs; [
      hyfetch
      vim
      vesktop
      flameshot
      fastfetch
      tree
      lolcat
      vscode
      steam
      telegram-desktop
      btop
      htop
      catppuccin-gtk
      papirus-icon-theme
      apple-cursor
      pfetch
      ufetch
      obs-studio
      cmatrix
      onlyoffice-desktopeditors
    ];
  };

  programs.firefox.enable = true;
}
