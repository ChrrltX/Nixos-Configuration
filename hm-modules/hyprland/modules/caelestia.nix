{ config, lib, pkgs, ... }:

{

  services.caelestia-shell = {
    
     # Configuration:
    config = {

      bar.workspaces = {
        shown = 10;
        activeLabel = "● ";
        occupiedLabel = "○ ";
      };
      
      dashboard = {
        dashboard.weatherLocation = "49.18251498377868,16.60457334096215";
        visualiserBars = 60;
      };
      
      launcher = {
        maxShown = 10;
        enableDangerousActions = false;  # Keep this false for safety
      };
      
      paths = {
        wallpaperDir = "~/nixos/themes/wallpapers";
      };

    };
  };
  

  environment.systemPackages = with pkgs; [
   
    # Core Requirements:
    quickshell
    
     # System Utilities:
    ddcutil          # Display brightness control
    brightnessctl    # Backlight control
    lm_sensors       # Hardware sensors
    
  ];
  
   # Disable Fish:
  programs.fish.enable = false;

   # Security Settings For ddcutil:
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
  
}
