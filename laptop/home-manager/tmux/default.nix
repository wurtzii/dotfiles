{ 
    config,
        pkgs,
        inputs,
        lib,
        ...
}: {

    home.packages = with pkgs; [

    ];

    programs.tmux = {
        enable = true;
        keyMode = "vi";
        mouse = true;
        extraConfig = ''
            set -g status off
        '';
        terminal = "screen-256color";
    };

    xdg.configFile = {
    };
}


