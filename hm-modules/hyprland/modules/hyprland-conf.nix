{ config, pkgs, lib, inputs, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
     
     # Hyprland:
    wayland.windowManager.hyprland = {
      settings = {
        
	general = {
           
	   # Gaps Between Windows:
	  gaps_in = "5";
	  gaps_out = "20";
	  border_size = "2";

	  resize_on_border = false;
	  allow_tearing = true;
	  layout = "dwindle";
	
	};

	decoration = {
	   
	   # Window Corner Rounding:
	  rounding = "10";
	  rounding_power = "2";
	   
	   # Window Opacity:
	  active_opacity = "0.85";
	  inactive_opacity = "0.8";

	  shadow = {
	    
	    enabled = true;

	    range = "4";
	    render_power = "3";

	  };

	  blur = {
	    
	    enabled = true;

	    size = "3";
	    passes = "1";
	    vibrancy = "0.1696";

	  };
	};  

        animations = {

	  enabled = true;

	  bezier = [

	    "easeOutQuint,0.23,1,0.32,1"
	    "easeInOutCubic,0.65,0.05,0.36,1"
	    "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
	    "quick,0.15,0,0.1,1"

	  ];  

	  animation = [
	    
	    "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
	  
	  ];
	};
        
	dwindle = {
	  
	  pseudotile = true;
	  preserve_split = true;

	};

	master = {
	  
	  new_status = "master";

	};

	misc = {
          
          disable_hyprland_logo = true;
	  disable_splash_rendering = true;

	};

	input = {
	  
	   # Keyboard Settings:
	  kb_layout = "us,cz";
	  numlock_by_default = true;

	  follow_mouse = "1";
           
	   # Mouse Settings:
	  sensitivity = "0";

          touchpad = {

            natural_scroll = true;
            disable_while_typing = true;
            clickfinger_behavior = true;
            scroll_factor = "0.5";

          };

	  gestures = {
        
	    workspace_swipe = true;
            workspace_swipe_distance = "700";
            workspace_swipe_fingers = "3";
            workspace_swipe_min_fingers = true;
            workspace_swipe_cancel_ratio = "0.2";
            workspace_swipe_min_speed_to_force = "5";
            workspace_swipe_direction_lock = true;
            workspace_swipe_direction_lock_threshold = "10";
            workspace_swipe_create_new = true;
          
	  };
	
	};
         
	 # Definitions:
        "$mod" = "SUPER";
	"$terminal" = "kitty";
	"$browser" = "brave";

	bind = [
	  
	   # Main Binds:
	  "$mod, Q, killactive,"
          "$mod, Backspace, exit,"
          "$mod, V, togglefloating,"

	   # Executables:
	  "$mod, Tab, exec, $terminal"
	  "$mod, B, exec, $browser"
	  "$mod, S, exec, steam"
	  "$mod, D, exec, vesktop"
	  "$mod, R, exec, obsidian"
          
	   # Move Focus:
	  "$mod, left, movefocus, l"
	  "$mod, right, movefocus, r"
	  "$mod, up, movefocus, u"
	  "$mod, down, movefocus, d"
	   
	   # Move Workspaces:
	  "$mod, 1, workspace, 1"
	  "$mod, 2, workspace, 2"
	  "$mod, 3, workspace, 3"
	  "$mod, 4, workspace, 4"
	  "$mod, 5, workspace, 5"
	  "$mod, 6, workspace, 6"
	  "$mod, 7, workspace, 7"
	  "$mod, 8, workspace, 8"
	  "$mod, 9, workspace, 9"
	  "$mod, 0, workspace, 10"

	   # Scroll Workspaces:
	  "$mod, mouse_down, workspace, e+1"
	  "$mod, mouse_up, workspace, e-1"

	   # Move Windows to Workspaces:
	  "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
	  "$mod SHIFT, 3, movetoworkspace, 3"
	  "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6" 
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10" 

	];

        bindm = [
          
	   # Resize Windows:
	  "$mod, mouse:272, movewindow"
	  "$mod, mouse:273, resizewindow"

	];

	bindle = [
          
          "XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
	  "XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"

	];

	bindl = [

          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
	  ",XF86AudioNext, exec, playerctl next"
	  ",XF86AudioPrev, exec, playerctl previous"
	  ",XF86AudioPlay, exec, playerctl play-pause"
	  ",XF86AudioPause, exec, playerctl play-pause"

	];
         
	windowrule = [
	   
	   # Other Stuff and Fixes:
	  "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	  "suppressevent maximize, class:.*"
	
	];

	windowrulev2 = [
          
	  "center, title:^(Open File)(.*)$"
	  "center, title:^(Select a File)(.*)$"
	  "center, title:^(Choose wallpaper)(.*)$"
	  "center, title:^(Open Folder)(.*)$"
	  "center, title:^(Save As)(.*)$"
	  "center, title:^(Library)(.*)$"
	  "center, title:^(File Upload)(.*)$"
	  "float, title:^(Open File)(.*)$"
	  "float, title:^(Select a File)(.*)$"
	  "float, title:^(Choose wallpaper)(.*)$"
	  "float, title:^(Open Folder)(.*)$"
	  "float, title:^(Save As)(.*)$"
	  "float, title:^(Library)(.*)$"
	  "float, title:^(File Upload)(.*)$"

	  "immediate, class:^(steam_app)"
	  "immediate, title:.*minecraft.*"
	  "immediate, title:.*\.exe"

	];

      
      };

    };
  };  
}
