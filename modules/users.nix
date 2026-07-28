{ pkgs, ... }:

{
  users.users.citrus = {
    isNormalUser = true;
    description = "citrus";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
