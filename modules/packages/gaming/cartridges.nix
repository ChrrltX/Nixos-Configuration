{ config, pkgs, lib, ... }:

{
  options = {
    cartridges.enable = 
      lib.mkEnableOption "enables cartridges";
  };
  
  config = lib.mkIf config.cartridges.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ cartridges ];
    };

  };  
}
