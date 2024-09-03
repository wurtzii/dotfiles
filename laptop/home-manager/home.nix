{ 
  config,
  pkgs,
  inputs,
  lib,
  ...
  }: {

    imports = [
      ./nvim
      ./sway
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
      sessionVariables = {
        EDITOR = "nvim";
      };
    };

    programs.home-manager.enable = true;
    programs.lazygit.enable = true;
    programs.git = {
        enable = true;
        userName = "wurtzii";
        userEmail = "wurtzii05@gmail.com";

        extraConfig = {
            core = {
                editor = "nvim";
            };

            init = {
                defaultBranch = "main";
            };
        };
    };


    programs.firefox.enable = true;

    xdg.enable = true;
    xdg.systemDirs.data = ["${config.home.homeDirectory}/.nix-profile/share/applications"];

    systemd.user.startServices = "sd-switch";
    home.stateVersion = "24.05";
  }
