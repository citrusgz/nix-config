{ pkgs, inputs, ... }:

let
  assets = import ../pkgs/plasma-assets.nix {
    inherit pkgs;
    inherit (inputs) wisteria-kde-theme layan-kde weather-widget-plus;
  };
in

{
  imports = [ ./plasma-generated.nix ];

  home.packages = with pkgs; [
    fluent-icon-theme
    whitesur-cursors
    assets.wisteria-kde
    assets.simple-tux-splash
    assets.layan-kde
    assets.weather-widget-plus
    assets.wallpaper
  ];

  programs.plasma = {
    enable = true;

    overrideConfig = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaper = "${assets.wallpaper}/share/wallpapers/wallpaper.jpg";
    };

    panels = [
      {
        location = "bottom";
        height = 36;
        floating = true;
        opacity = "translucent";
        widgets = [
          {
            kickoff.icon = "nix";
          }
          {
            iconTasks.launchers = [
              "applications:systemsettings.desktop"
              "preferred://filemanager"
              "preferred://browser"
              "applications:org.kde.konsole.desktop"
              "applications:firefox.desktop"
              "applications:anytype.desktop"
            ];
          }
          "org.kde.plasma.marginsseparator"
          {
            systemTray.items = {
              shown = [
                "spotify-client"
                "Nextcloud"
              ];
              extra = [
                "org.kde.plasma.manage-inputmethod"
                "org.kde.plasma.notifications"
                "org.kde.plasma.cameraindicator"
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.mediacontroller"
                "org.kde.plasma.clipboard"
                "org.kde.plasma.volume"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.weather"
                "org.kde.kscreen"
                "org.kde.plasma.battery"
                "org.kde.plasma.printmanager"
                "org.kde.plasma.brightness"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.keyboardlayout"
              ];
            };
          }
          {
            digitalClock.calendar.plugins = [
              "holidaysevents"
              "astronomicalevents"
            ];
          }
          {
            name = "weather.widget.plus";
            config = {
              Location = {
                firstRun = false;
                places = ''[{"providerId":"om","placeIdentifier":"latitude=-32.0206&longitude=-52.0555&altitude=5","placeAlias":"Rio Grande, RS","timezoneID":68}]'';
              };
              Units.windSpeedType = "kmh";
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
  };
}
