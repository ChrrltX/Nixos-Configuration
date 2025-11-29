{ config, pkgs, lib, inputs, ... }:

{ 
  options = {
    sunsetr.enable = 
      lib.mkEnableOption "enables sunsetr";
  };
  
  config = lib.mkIf config.sunsetr.enable {
    
    environment.systemPackages = with pkgs; [ sunsetr ];

    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = with pkgs; [ hyprsunset ];

      home.file."~/.config/sunsetr/sunsetr.toml" = {
        source = ./sunsetr.nix;
        recursive = true;
        text = ''
        
          backend = "auto"         # Backend to use: "auto", "hyprland", "hyprsunset" or "wayland"
          transition_mode = "geo"  # Select: "geo", "finish_by", "start_at", "center", "static"

          smoothing = true         # Enable smooth transitions during startup and exit
          startup_duration = 0.5   # Duration of smooth startup in seconds (0.1-60 | 0 = instant)
          shutdown_duration = 0.5  # Duration of smooth shutdown in seconds (0.1-60 | 0 = instant)
          adaptive_interval = 1    # Adaptive interval base for smooth transitions (1-1000)ms

          night_temp = 3300        # Color temperature during night (1000-20000) Kelvin
          day_temp = 6500          # Color temperature during day (1000-20000) Kelvin
          night_gamma = 100         # Gamma percentage for night (10-100%)
          day_gamma = 100          # Gamma percentage for day (10-100%)
          update_interval = 60     # Update frequency during transitions in seconds (10-300)

        '';
      };  

    };
  };  
}
