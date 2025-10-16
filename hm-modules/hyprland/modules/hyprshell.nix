{ config, pkgs, lib, ... }:

{
  options = {
    hyprshell.enable = 
      lib.mkEnableOption "enables hyprshell";
  };
  
  config = lib.mkIf config.hyprshell.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.hyprshell.enable = true;
    };

  };  
}

