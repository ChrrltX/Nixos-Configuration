{ config, pkgs, lib, ... }:

{
  options = {
    plymouth.enable = 
      lib.mkEnableOption "enables plymouth";
  };
  
  config = lib.mkIf config.plymouth.enable {
  
    boot = {

      plymouth = {
        
        enable = true;
        
        theme = "Cuts Alt";
        
        themePackages = with pkgs; [
          (adi1090x-plymouth-themes.override {
            selected_themes = [ 
              
              "Black HUD"
              "Blockchain"
              "Circuit"
              "Connect"
              "Cuts"
              "Cuts Alt"
              "Green Loader"
              "Hud 3"
              "Loader"
              "Spinner Alt"

            ];
          })
        ];

      };

       # Enable Silent Boot:
      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "udev.log_priority=3"
        "rd.systemd.show_status=auto"
      ];

       # Open The Bootloader List By Pressing Any Key!

      loader.timeout = 0;

    };

  };  
}
