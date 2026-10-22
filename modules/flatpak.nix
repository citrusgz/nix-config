{ pkgs, lib, ... }:

let
  flatpaks = [
    "com.protonvpn.www"
    "com.stremio.Stremio"
  ];
in {
  services.flatpak.enable = true;

  systemd.services.flatpak-install = {
    description = "Reconcile declared Flatpak applications";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    restartTriggers = [ (lib.concatStringsSep " " flatpaks) ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      set -u

      flatpak="${pkgs.flatpak}/bin/flatpak"
      sleep="${pkgs.coreutils}/bin/sleep"
      state="/var/lib/flatpak/.nix-flatpak-managed"
      desired="${lib.concatStringsSep " " flatpaks}"
      repo="https://flathub.org/repo/flathub.flatpakrepo"

      mkdir -p "$(dirname "$state")"

      attempt=1
      max_attempts=12
      while [ "$attempt" -le "$max_attempts" ]; do
        if "$flatpak" remote-add --if-not-exists --system flathub "$repo"; then
          attempt=0
          break
        fi
        echo "flatpak: flathub indisponível (tentativa $attempt de $max_attempts), aguardando a rede"
        attempt=$((attempt + 1))
        "$sleep" 10
      done

      if [ "$attempt" -ne 0 ]; then
        echo "flatpak: sem acesso ao flathub, os aplicativos declarados não foram reconciliados"
        exit 0
      fi

      for app in $desired; do
        if ! "$flatpak" info --system "$app" >/dev/null 2>&1; then
          "$flatpak" install --noninteractive --assumeyes --system flathub "$app" \
            || echo "flatpak: falha ao instalar $app"
        fi
      done

      if [ -f "$state" ]; then
        while read -r app; do
          [ -n "$app" ] || continue
          case " $desired " in
            *" $app "*) ;;
            *)
              "$flatpak" uninstall --system --noninteractive --assumeyes "$app" \
                || echo "flatpak: falha ao remover $app"
              ;;
          esac
        done < "$state"
      fi

      printf '%s\n' $desired > "$state"
    '';
  };

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
