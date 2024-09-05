{ 
    config,
        pkgs,
        inputs,
        lib,
        ...
}: {

    home.packages = with pkgs; [

    ];

    programs.bash = {
        enable = true;
        bashrcExtra = ''
            [ "$(tty)" = "/dev/tty1" ] && exec sway
            '';
    };
}


