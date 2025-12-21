{ config, pkgs, lib, ... }:

{
  options = {
    hyprviz.enable = 
      lib.mkEnableOption "enables hyprviz";
  };
  
  config = lib.mkIf config.hyprviz.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ hyprviz ];
    };

  };  
}
