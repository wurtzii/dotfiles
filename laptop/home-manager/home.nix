{ 
  inputs,
  lib,
  config,
  pkgs,
  ...
  }: {

    imports = [
    ];

    nixpkgs = {
      overlays = [];
      config = {
        allowUnfree = true;
	allowUnfreePrecicate = _: true;
      };
    };

    home = {
      username = "gabriel";
      homeDirectory = "/home/gabriel";
    };

    programs.home-manager.enable = true;
    programs.git = {
      enable = true;
      userName = "wurtzii";
      userEmail = "wurtzii05@gmail.com";
    };

    programs.firefox.enable = true;

    systemd.user.startServices = "sd-switch";
    home.stateVersion = "24.05";
  }
