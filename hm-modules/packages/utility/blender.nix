{ config, pkgs, lib, ... }:

{
  options = {
    blender.enable = 
      lib.mkEnableOption "enables blender";
  };
  
  config = lib.mkIf config.blender.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.blender.enable = true;
    };

  };  
}
