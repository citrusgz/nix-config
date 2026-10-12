{ pkgs, ... }:

let
  assets = import ../pkgs/plasma-assets.nix { inherit pkgs; };
in

{
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
      theme = "WisteriaKDE";
      iconTheme = "Fluent";
      cursor = {
        theme = "WhiteSur-cursors";
      };
      splashScreen.theme = "SimpleTuxSplash-Plasma6";
      windowDecorations = {
        library = "org.kde.kwin.aurorae.v2";
        theme = "__aurorae__svg__Layan";
      };
      wallpaper = "${assets.wallpaper}/share/wallpapers/wallpaper.jpg";
    };

    kwin = {
      effects = {
        blur = {
          enable = true;
          strength = 10;
        };
        zoom.enable = false;
      };
      nightLight.enable = true;
      virtualDesktops = {
        number = 1;
        rows = 1;
      };
      tiling = {
        padding = 4;
        layout = {
          id = "306f5f75-ef34-41cc-b182-52a93885b0ad";
          tiles = {
            layoutDirection = "horizontal";
            tiles = [
              { width = 0.25; }
              { width = 0.5; }
              { width = 0.25; }
            ];
          };
        };
      };
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

    shortcuts = {
      ActivityManager.switch-to-activity-4cb78287-49ae-435d-a856-2643c12b5a09 = [ ];
      "KDE Keyboard Layout Switcher" = {
        "Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "Switch to Next Keyboard Layout" = "Meta+Alt+K";
      };
      anytype."1BAEEE9D408A786167569B8181D0C27C-Ctrl+Shift+Space" = [ ];
      "app.fluxer.Fluxer" = {
        "4E13FA45AC0AAA7ECB09E79DE3A7E627-Ctrl+Shift+D" = [ ];
        "9AC8B728B7FEF08D27943566900C6D34-Ctrl+Shift+M" = [ ];
      };
      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      kmix = {
        decrease_microphone_volume = "Microphone Volume Down";
        decrease_volume = "Volume Down";
        decrease_volume_small = "Shift+Volume Down";
        increase_microphone_volume = "Microphone Volume Up";
        increase_volume = "Volume Up";
        increase_volume_small = "Shift+Volume Up";
        mic_mute = [
          "Microphone Mute"
          "Meta+Volume Mute"
        ];
        mute = "Volume Mute";
        push_to_talk = [ ];
      };
      ksmserver = {
        "Halt Without Confirmation" = [ ];
        "Lock Session" = [
          "Screensaver"
          "Meta+L"
        ];
        "Log Out" = "Ctrl+Alt+Del";
        "Log Out Without Confirmation" = [ ];
        LogOut = [ ];
        Reboot = [ ];
        "Reboot Without Confirmation" = [ ];
        "Shut Down" = [ ];
      };
      kwin = {
        "Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "Cycle Overview" = [ ];
        "Cycle Overview Opposite" = [ ];
        "Decrease Opacity" = [ ];
        "Edit Tiles" = "Meta+T";
        Expose = [
          "Ctrl+F9"
          "Meta+F9"
        ];
        ExposeAll = [
          "Launch (C)"
          "Ctrl+F10"
          "Meta+F10"
        ];
        ExposeClass = [
          "Ctrl+F7"
          "Meta+F7"
        ];
        ExposeClassCurrentDesktop = [ ];
        "Grid View" = "Meta+G";
        "Increase Opacity" = [ ];
        "Kill Window" = "Meta+Ctrl+Esc";
        "Move Tablet to Next LogicalOutput" = [ ];
        MoveMouseToCenter = "Meta+F6";
        MoveMouseToFocus = "Meta+F5";
        MoveZoomDown = [ ];
        MoveZoomLeft = [ ];
        MoveZoomRight = [ ];
        MoveZoomUp = [ ];
        Overview = "Meta+W";
        "Setup Window Shortcut" = [ ];
        "Show Desktop" = "Meta+D";
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "Switch Window Down" = "Meta+Alt+Down";
        "Switch Window Left" = "Meta+Alt+Left";
        "Switch Window Right" = "Meta+Alt+Right";
        "Switch Window Up" = "Meta+Alt+Up";
        "Switch to Desktop 1" = [
          "Ctrl+F1"
          "Meta+F1"
        ];
        "Switch to Desktop 2" = [
          "Ctrl+F2"
          "Meta+F2"
        ];
        "Switch to Desktop 3" = [
          "Ctrl+F3"
          "Meta+F3"
        ];
        "Switch to Desktop 4" = [
          "Ctrl+F4"
          "Meta+F4"
        ];
        "Toggle Night Color" = [ ];
        "Toggle Window Raise/Lower" = [ ];
        "Walk Through Windows" = [
          "Alt+Tab"
          "Meta+Tab"
        ];
        "Walk Through Windows (Reverse)" = [
          "Alt+Shift+Tab"
          "Meta+Shift+Tab"
        ];
        "Walk Through Windows Alternative" = [ ];
        "Walk Through Windows Alternative (Reverse)" = [ ];
        "Walk Through Windows of Current Application" = [
          "Alt+`"
          "Meta+`"
        ];
        "Walk Through Windows of Current Application (Reverse)" = [
          "Alt+~"
          "Meta+~"
        ];
        "Walk Through Windows of Current Application Alternative" = [ ];
        "Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
        "Window Close" = "Alt+F4";
        "Window Maximize" = "Meta+PgUp";
        "Window Minimize" = "Meta+PgDown";
        "Window Operations Menu" = "Alt+F3";
        "Window Quick Tile Bottom" = "Meta+Down";
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
        "Window Quick Tile Top" = "Meta+Up";
        "Window Restore" = "Meta+Backspace";
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "Window to Next Screen" = "Meta+Shift+Right";
        "Window to Previous Screen" = "Meta+Shift+Left";
        disableInputCapture = "Meta+Shift+Esc";
        view_actual_size = "Meta+0";
        view_zoom_in = [
          "Meta++"
          "Meta+="
        ];
        view_zoom_out = "Meta+-";
      };
      mediacontrol = {
        mediavolumedown = [ ];
        mediavolumeup = [ ];
        nextmedia = "Media Next";
        pausemedia = "Media Pause";
        playmedia = [ ];
        playpausemedia = "Media Play";
        previousmedia = "Media Previous";
        seekbackwardmedia = "Media Rewind";
        seekbackwardmedialong = [ ];
        seekforwardmedia = "Media Fast Forward";
        seekforwardmedialong = [ ];
        stopmedia = "Media Stop";
      };
      org_kde_powerdevil = {
        "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "Decrease Screen Brightness" = "Monitor Brightness Down";
        "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        Hibernate = "Hibernate";
        "Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "Increase Screen Brightness" = "Monitor Brightness Up";
        "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        PowerDown = "Power Down";
        PowerOff = "Power Off";
        Sleep = "Sleep";
        "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "Turn Off Screen" = [ ];
        powerProfile = [
          "Battery"
          "Meta+B"
        ];
      };
      plasmashell = {
        "Slideshow Wallpaper Next Image" = [ ];
        "activate application launcher" = [
          "Meta"
          "Alt+F1"
        ];
        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
        "clear history" = [ ];
        clear-history = [ ];
        clipboard_action = "Meta+Ctrl+X";
        cycle-panels = "Meta+Alt+P";
        cycleNextAction = [ ];
        cyclePrevAction = [ ];
        edit_clipboard = [ ];
        "manage activities" = "Meta+Q";
        "next activity" = "Meta+A";
        "previous activity" = "Meta+Shift+A";
        repeat_action = [ ];
        "show dashboard" = "Ctrl+F12";
        show-barcode = [ ];
        show-on-mouse-pos = "Meta+V";
        "switch to next activity" = [ ];
        "switch to previous activity" = [ ];
        "toggle do not disturb" = [ ];
      };
    };

    configFile = {
      kdeglobals = {
        General.UseSystemBell = true;
        KDE = {
          contrast = 4;
          frameContrast = 0.2;
        };
        WM = {
          activeBackground = "39,44,49";
          activeBlend = "252,252,252";
          activeForeground = "252,252,252";
          inactiveBackground = "32,36,40";
          inactiveBlend = "161,169,177";
          inactiveForeground = "161,169,177";
        };
        "KFileDialog Settings" = {
          "Allow Expansion" = false;
          "Automatically select filename extension" = true;
          "Breadcrumb Navigation" = false;
          "Decoration position" = 2;
          "Show Full Path" = false;
          "Show Inline Previews" = true;
          "Show Preview" = false;
          "Show Speedbar" = true;
          "Show hidden files" = false;
          "Sort by" = "Date";
          "Sort directories first" = true;
          "Sort hidden files last" = false;
          "Sort reversed" = false;
          "Speedbar Width" = 146;
          "View Style" = "Simple";
        };
      };
      kscreenlockerrc = {
        Daemon = {
          Autolock = false;
          Timeout = 0;
        };
        "Greeter/Wallpaper/org.kde.image/General" = {
          Image = "${assets.wallpaper}/share/wallpapers/wallpaper.jpg";
          PreviewImage = "${assets.wallpaper}/share/wallpapers/wallpaper.jpg";
        };
      };
      ksmserverrc.General.loginMode = "emptySession";
      kwalletrc.Wallet."First Use" = false;
      kwinrc.Xwayland.Scale = 1;
      "plasma-localerc".Formats.LANG = "pt_BR.UTF-8";
      plasmarc.Wallpapers.usersWallpapers = "";
      spectaclerc = {
        ImageSave.translatedScreenshotsFolder = "Capturas de tela";
        VideoSave.translatedScreencastsFolder = "Capturas de vídeo";
      };
      systemsettingsrc.systemsettings_sidebar_mode.HighlightNonDefaultSettings = true;
      baloofilerc.General.dbVersion = 2;
      kactivitymanagerdrc.activities."4cb78287-49ae-435d-a856-2643c12b5a09" = "Padrão";
      kded5rc = {
        Module-browserintegrationreminder.autoload = false;
        Module-device_automounter.autoload = false;
      };
      katerc = {
        General = {
          "Days Meta Infos" = 30;
          PinnedDocuments = "";
          "Save Meta Infos" = true;
          "Show Full Path in Title" = false;
          "Show Menu Bar" = true;
          "Show Status Bar" = true;
          "Show Tab Bar" = true;
          "Show Url Nav Bar" = true;
        };
        filetree = {
          editShade = "30,78,103";
          listMode = false;
          middleClickToClose = false;
          shadingEnabled = true;
          showCloseButton = false;
          showFullPathOnRoots = false;
          showToolbar = true;
          sortRole = 0;
          viewShade = "77,46,91";
        };
      };
    };
  };
}
