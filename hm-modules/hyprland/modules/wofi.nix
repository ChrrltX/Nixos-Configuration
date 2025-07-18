{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {

    wayland.windowManager.hyprland = {
      
      settings = {
         
	 # Bind Rofi:
        "$menu" = "wofi --show drun";

        bind = [ "$mod, Space, exec, $menu" ];

      };

    };  

    stylix.targets.wofi.enable = true;

    programs.wofi = {
      
      enable = true;

      };

      style = ''
        
	* {
	  border: 0;
	  margin: 0;
	  padding: 0;
	  spacing: 0;
	}

	window {
	  width: 45%;
	}

	element {
          padding: 12;
	}

	element-text {
	  vertical-align: 0.5;
	}

	element-icon {
	  size: 30;
	}

	entry {
	  padding: 12;
	}

	inputbar {
	  children: [promt, entry];
	}

	listview {
	  columns: 1;
	  lines: 8;
	}

	mainbox {
	  children: [inputbar, listview];
	}

	promt {
	  enabled: true;
	  padding: 12 0 0 12;
	}

      '';
    };   

  };
}
