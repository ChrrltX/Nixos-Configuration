{ config, pkgs, lib, ... }:

{
  options = {
    osu.enable = 
      lib.mkEnableOption "enables osu";
  };
  
  config = lib.mkIf config.osu.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      programs.osu-lazer.enable = true;
    };

  };  
}
