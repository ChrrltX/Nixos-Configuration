{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    hyprsunset.enable = 
      lib.mkEnableOption "enables hyprsunset";
  };
  
  config = lib.mkIf config.hyprsunset.enable {

    services.hyprsunset.enable = true;

    services.hyprsunset.transitions = {

      night = {
        start = "20:00";
        end = "07:00";
        temperature = 5000;
        gamma = 0.8;
      };

      day = {
        start = "07:00";
        end = "20:00";
        identity = true;
      };

    };

  };  
}
