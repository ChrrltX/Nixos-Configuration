{ config, pkgs, lib, ... }:

{
  options = {
    duf.enable = 
      lib.mkEnableOption "enables duf";
  };
  
  config = lib.mkIf config.duf.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ duf ];
    };

  };  
}
