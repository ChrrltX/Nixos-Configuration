{ config, pkgs, lib, ... }:

{
  options = {
    alpaca.enable = 
      lib.mkEnableOption "enables alpaca";
  };
  
  config = lib.mkIf config.alpaca.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {
      home.packages = with pkgs; [ alpaca ];
    };

  };  
}
