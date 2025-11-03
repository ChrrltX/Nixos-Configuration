{ config, pkgs, lib, ... }:

{
  options = {
    brave.enable = 
      lib.mkEnableOption "enables brave";
  };
  
  config = lib.mkIf config.brave.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.brave.enable = true;
    };

  };  
}

