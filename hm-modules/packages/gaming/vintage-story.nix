{ config, pkgs, lib, ... }:

{
  options = {
    vintage-story.enable = 
      lib.mkEnableOption "enables vintage-story";
  };
  
  config = lib.mkIf config.vintage-story.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ vintagestory ];
    };

  };  
}
