{ config, pkgs, lib, ... }:

{ 
  options = {
    waybar-2.enable = 
      lib.mkEnableOption "enables waybar-2";
  };
  
  config = lib.mkIf config.waybar-2.enable {

  home-manager.users.chrrltx = { pkgs, ... }: {
    
    stylix.targets.waybar.enable = false;

    programs.waybar = {
      
      enable = true;

      settings = {

        mainBar = {
	  
	  layer = "top";
	  position = "top";
	  height = 50;
	  margin-top = 0;
	  margin-left = 0;
	  margin-right = 0;
           
	   # Module Positions:

	  modules-left = [

	  ];
	  modules-center = [
            "clock"
	  ];  
	  modules-right = [ 

	  ];

	   # Modules:

           "clock" = {
             format = "{%B %d %r %A}";
           };

	};
      };

      style = ''
        
	* {
	  font-family: "SF Pro Display", "JetBrainsMono Nerd Font Propo";
	  font-size: 15px;
	  font-weight: bold;
	}  

	window#waybar {
	  all:unset;
	} 

	.modules-left {
          padding:7px;
          margin:10 0 5 0;
          background: rgba(30, 30, 46, 0.8);
	}

	.modules-center {
          padding:7px;
          margin:10 0 5 0;
          background: rgba(30, 30, 46, 0.8);
	}
        
        .modules-right {
          padding:7px;
          margin:10 0 5 0;
          background: rgba(30, 30, 46, 0.8);
	}  

	tooltip {
	}

      '';

    };  
  };
  };
}
