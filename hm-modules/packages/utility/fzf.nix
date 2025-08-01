{ config, pkgs, lib, ... }:

{
  options = {
    fzf.enable = 
      lib.mkEnableOption "enables fzf";
  };

  config = lib.mkIf config.fzf.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ fzf ];
    };

  };  
}
