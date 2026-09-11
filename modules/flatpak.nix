{ pkgs, lib, ... }:

let
  flatpaks = [
    "com.protonvpn.www"
  ];
in {
  services.flatpak.enable = true;

  system.activationScripts.flatpak-install = lib.stringAfter [ "var" ] ''
    ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
    for app in ${lib.concatStringsSep " " flatpaks}; do
      if ! ${pkgs.flatpak}/bin/flatpak info --system "$app" >/dev/null 2>&1; then
        ${pkgs.flatpak}/bin/flatpak install --noninteractive --assumeyes --system flathub "$app" \
          || echo "flatpak: falha ao instalar $app"
      fi
    done
  '';

  systemd.services.flatpak-update = {
    description = "Update Flatpak packages";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.flatpak}/bin/flatpak update --system --noninteractive --assumeyes";
    };
  };

  systemd.timers.flatpak-update = {
    description = "Weekly Flatpak update";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
      RandomizedDelaySec = "15m";
    };
  };
}