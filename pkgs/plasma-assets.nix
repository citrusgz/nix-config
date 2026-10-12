{ pkgs, wisteria-kde-theme, layan-kde, weather-widget-plus }:

{
  wisteria-kde = pkgs.runCommandLocal "wisteria-kde" { } ''
    mkdir -p "$out/share/plasma/desktoptheme"
    cp -r ${wisteria-kde-theme}/plasma-style/WisteriaKDE "$out/share/plasma/desktoptheme/WisteriaKDE"
  '';

  layan-kde = pkgs.runCommandLocal "layan-kde" { } ''
    mkdir -p "$out/share/aurorae/themes"
    cp -r ${layan-kde}/aurorae/themes/Layan "$out/share/aurorae/themes/Layan"
  '';

  weather-widget-plus = pkgs.runCommandLocal "weather-widget-plus" { } ''
    mkdir -p "$out/share/plasma/plasmoids"
    cp -r ${weather-widget-plus}/weather.widget.plus "$out/share/plasma/plasmoids/weather.widget.plus"
  '';

  simple-tux-splash = pkgs.runCommandLocal "simple-tux-splash" { } ''
    mkdir -p "$out/share/plasma/look-and-feel"
    cp -r ${../assets/simple-tux-splash} "$out/share/plasma/look-and-feel/SimpleTuxSplash-Plasma6"
  '';

  wallpaper = pkgs.runCommandLocal "wallpaper" { } ''
    mkdir -p "$out/share/wallpapers"
    cp ${../assets/wallpaper.jpg} "$out/share/wallpapers/wallpaper.jpg"
  '';
}
