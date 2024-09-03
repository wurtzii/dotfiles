{ 
    config,
        pkgs,
        inputs,
        lib,
        ...
}: {

    home.packages = with pkgs; [
        alacritty
        rofi
    ];

    programs.swayr = {
        enable = true;
        settings = {
            layout = {
                auto_tile = false;
                  auto_tile_min_window_width_per_output_width = [
                    [ 800 400 ]
                    [ 1024 500 ]
                    [ 1280 600 ]
                    [ 1400 680 ]
                    [ 1440 700 ]
                    [ 1600 780 ]
                    [ 1680 780 ]
                    [ 1920 920 ]
                    [ 2048 980 ]
                    [ 2560 1000 ]
                    [ 3440 1200 ]
                    [ 3840 1280 ]
                    [ 4096 1400 ]
                    [ 4480 1600 ]
                    [ 7680 2400 ]
                  ];
            };
        };
    };

    xdg.configFile = {
     "sway/config".source = ./config;
     "sway/backgrounds".source = ./backgrounds;
     };
}


