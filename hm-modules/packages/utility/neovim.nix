{ config, pkgs, lib, ... }:

{
  options = {
    neovim.enable = 
      lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.neovim.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.neovim.enable = true;  
    };

  };  
}
