{ config, pkgs, lib, ... }:

{
  options = {
    tmux.enable = 
      lib.mkEnableOption "enables tmux";
  };
  
  config = lib.mkIf config.tmux.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ tmux ];
    };

  };  
}
