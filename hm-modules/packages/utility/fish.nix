{ config, pkgs, lib, ... }:

{
  options = {
    fish.enable = 
      lib.mkEnableOption "enables fish";
  };
  
  config = lib.mkIf config.fish.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.fish.enable = true;
    };

  };  
}
