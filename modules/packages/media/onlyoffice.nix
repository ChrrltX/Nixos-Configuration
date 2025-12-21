{ config, pkgs, lib, ... }:

{
  options = {
    onlyoffice.enable = 
      lib.mkEnableOption "enables onlyoffice";
  };
  
  config = lib.mkIf config.onlyoffice.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ onlyoffice-desktopeditors ];
    };

  };  
}
