{ config, pkgs, lib, ... }:

{ 
  imports = [

    ./extensions/blur-my-shell.nix
    ./extensions/transparent-top-bar.nix
    ./extensions/rounded-corners.nix
    ./extensions/forge.nix
    ./extensions/weather.nix
    ./extensions/pano.nix
    ./extensions/top-bar-organizer.nix
    ./extensions/unite.nix
    ./extensions/just-perfection.nix
    ./extensions/tiling-shell.nix
    ./extensions/media-controls.nix
    ./extensions/tray-icons.nix
    ./extensions/dock.nix
    ./extensions/caffeine.nix
    ./extensions/lock-keys.nix
    ./extensions/runcat.nix

  ];

  options = {
    gnome.enable = 
      lib.mkEnableOption "enables gnome";
  };

  config = lib.mkIf config.gnome.enable {
     
     # Enable Gnome:
    services.desktopManager.gnome.enable = true;
     
     # Disable All Gnome Apps:
    services.gnome.core-utilities.enable = false;
    environment.gnome.excludePackages = with pkgs; [ gnome-tour nixos-render-docs ];

    home-manager.users.chrrltx = { pkgs, ... }: {
      
      dconf.settings = {

        "org/gnome/orca" = {
          enabled = false;
        };  
        
        "org/gnome/shell" = {
          disable-user-extensions = true;
        };  

        "org/gnome/desktop/interface" = {
          clock-format = "12h";
          clock-show-weekday = true;
          text-scaling-factor = 1;
          enable-hot-corners = false;
        };

        "org/gnome/desktop/a11y/keyboard" = {
          togglekeys-enable = true;
        };  

        "org/gnome/desktop/screensaver" = {
          lock-enabled = true;
        };  

        "org/gnome/desktop/peripherals/mouse" = {
          speed = 1.5;
        };
      
        "org/gnome/desktop/peripherals/keyboard" = {
          numlock-state = true;
        };  

        "org/gnome/desktop/session" = {
          idle-delay = 5;
        };

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-schedule-automatic = true;
        };

        "org/gnome/settings-daemon/plugins/power" = {
          power-button-action = "Power Off";
        };  

        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = true;
        };

        "org/gtk/settings/file-chooser" = {
          clock-format = "12h";
        };

        "org/gnome/desktop/sound" = {
          event-sounds = true;
        };

        "org/gnome/desktop/peripherals/keyboard" = {
          old-files-age = "3 days";
          remove-old-temp-files = true;
          remove-old-trash-files = true;
        };

      };  

    };   

  };  
}
