{ config, pkgs, lib, inputs, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      settings = {

	input = {
	  
	   # Keyboard Settings:
	  kb_layout = "us,cz";
          kb_variant = ",qwerty";
          kb_options = "grp:alt_shift_toggle";
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

	};  

        gestures = {
        
          #workspace_swipe = true;
          workspace_swipe_distance = "700";
          #workspace_swipe_fingers = "2";
          #workspace_swipe_min_fingers = true;
          workspace_swipe_cancel_ratio = "0.2";
          workspace_swipe_min_speed_to_force = "5";
          workspace_swipe_direction_lock = true;
          workspace_swipe_direction_lock_threshold = "10";
          workspace_swipe_create_new = true;
          
        };

      };
    };
  };
}
