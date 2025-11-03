{ config, pkgs, lib, ... }:

{
  options = {
    plymouth.enable = 
      lib.mkEnableOption "enables plymouth";
  };
  
  config = lib.mkIf config.plymouth.enable {
    
    stylix.targets.plymouth.enable = false;

    boot = {

      plymouth = {
        
        enable = true;
        
        theme = "cuts_alt";
        
        themePackages = with pkgs; [
          (adi1090x-plymouth-themes.override {
            selected_themes = [ 
              
              "black_hud"
              "blockchain"
              "circuit"
              "connect"
              "cuts"
              "cuts_alt"
              "green_loader"
              "hud_3"
              "loader"
              "spinner_alt"

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

      loader.timeout = 3;

    };

  };  
}
