with import <nixpkgs> {};
vim_configurable.customize { 
  name = "vim";
  vimrcConfig.customRC = builtins.readFile ./vimrc;
  vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-colorschemes vim-nix vim-lastplace ];
        opt = [];

      };
}
