{ pkgs, ... }:

{
  services.upower.enable = true;

  systemd.services.battery-charge-limit = {
    description = "Enable UPower battery charge limits when supported";
    wantedBy = [ "multi-user.target" ];
    after = [ "upower.service" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      set -u

      busctl="${pkgs.systemd}/bin/busctl"
      upower="${pkgs.upower}/bin/upower"

      batteries=$("$upower" -e | grep '/battery_' || true)
      if [ -z "$batteries" ]; then
        echo "No battery detected; skipping charge limit setup."
        exit 0
      fi

      for object in $batteries; do
        supported="$("$busctl" --system get-property org.freedesktop.UPower "$object" org.freedesktop.UPower.Device ChargeThresholdSupported 2>/dev/null || true)"
        case "$supported" in
          *true) ;;
          *)
            echo "$object: charge thresholds not supported; skipping."
            continue
            ;;
        esac

        end="$("$busctl" --system get-property org.freedesktop.UPower "$object" org.freedesktop.UPower.Device ChargeEndThreshold 2>/dev/null || true)"
        case "$end" in
          *80) ;;
          *) echo "$object: warning: UPower end threshold is '$end', expected 80." ;;
        esac

        enabled="$("$busctl" --system get-property org.freedesktop.UPower "$object" org.freedesktop.UPower.Device ChargeThresholdEnabled 2>/dev/null || true)"
        case "$enabled" in
          *true)
            echo "$object: charge limit already enabled."
            continue
            ;;
        esac

        echo "$object: enabling charge limit."
        "$busctl" --system call org.freedesktop.UPower "$object" org.freedesktop.UPower.Device EnableChargeThreshold b true
      done
    '';
  };
}
