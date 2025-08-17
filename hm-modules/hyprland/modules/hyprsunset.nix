{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    hyprsunset.enable = 
      lib.mkEnableOption "enables hyprsunset";
  };
  
  config = lib.mkIf config.hyprsunset.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {

      services.hyprsunset.enable = true;

      services.hyprsunset.transitions = {

        night = {
          calendar = "*-*-* 20:00:00";
          requests = [
            [ "temperature" "5000" ]
            [ "gamma 80" ]
          ];  
        };
       
        day = {
          calendar = "*-*-* 07:00:00";
          requests = [ 
            [ "tempeature" "6500" ]
            [ "gamma 100" ]
          ];  
        };
       
      };

    };
  };  
}
