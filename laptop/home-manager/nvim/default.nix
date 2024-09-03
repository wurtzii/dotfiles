{ 
    config,
        pkgs,
        inputs,
        lib,
        ...
}: {

    home.packages = with pkgs; [
        tree-sitter
        ripgrep
        clang_18
        zig
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        vimAlias = true;
        viAlias = true;
    };

    xdg.configFile = {
     "nvim/lua".source = ./lua;
     "nvim/lua/plugins".source = ./lua/plugins;
     "nvim/lua/gabe".source = ./lua/gabe;
     "nvim/init.lua".source = ./init.lua;
     };

#      nvim = {

#        source = 
#          config.lib.file.mkOutOfStoreSymlink #../../../nvim;
#          "${config.home.homeDirectory}/dotfiles/nvim";
#        recursive = true;
#      };
    # };

}


