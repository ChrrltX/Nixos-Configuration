{ config, pkgs, lib, inputs, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      settings = {

	 # Definitions:
        "$mod" = "SUPER";
	"$terminal" = "kitty";
	"$browser" = "zen-twilight";
        "$files" = "nautilus";
        "$screenshot" = ''grim -g "$(slurp -w 0)" - | swappy -f -'';

	bind = [
	  
	   # Main Binds:
	  "$mod, Q, killactive,"
	  "$mod SHIFT, Q, forcekillactive"
          "$mod, Backspace, exit,"
          "$mod SHIFT, V, togglefloating,"
	  "$mod SHIFT, F, fullscreen,"
          "$mod SHIFT, S, exec, $screenshot,"

	   # Executables:
	  "$mod, Tab, exec, $terminal"
	  "$mod, Z, exec, $browser"
	  "$mod, S, exec, steam"
	  "$mod, D, exec, vesktop"
	  "$mod, R, exec, obsidian"
          "$mod, W, exec, wallpaper-switcher"
          "$mod, F, exec, $files"
          
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
	  "$mod SHIFT, 1, workspace, 6"
	  "$mod SHIFT, 2, workspace, 7"
	  "$mod SHIFT, 3, workspace, 8"
	  "$mod SHIFT, 4, workspace, 9"
	  "$mod SHIFT, 5, workspace, 10"

	   # Scroll Workspaces:
	  "$mod, mouse_down, workspace, e+1"
	  "$mod, mouse_up, workspace, e-1"

	   # Move Windows to Workspaces:
	  "$mod CTRL, 1, movetoworkspace, 1"
          "$mod CTRL, 2, movetoworkspace, 2"
	  "$mod CTRL, 3, movetoworkspace, 3"
	  "$mod CTRL, 4, movetoworkspace, 4"
          "$mod CTRL, 5, movetoworkspace, 5"
          "$mod CTRL SHIFT, 1, movetoworkspace, 6" 
          "$mod CTRL SHIFT, 2, movetoworkspace, 7"
          "$mod CTRL SHIFT, 3, movetoworkspace, 8"
          "$mod CTRL SHIFT, 4, movetoworkspace, 9"
          "$mod CTRL SHIFT, 5, movetoworkspace, 10" 

	];

        bindm = [
          
	   # Resize Windows:
	  "$mod, mouse:272, movewindow"
	  "$mod, mouse:273, resizewindow"

	];

	bindle = [
           
	   # Increasing/Decreasing Volume:
	  ",XF86AudioRaiseVolume, exec, progress-osd --volume +2%"
          ",XF86AudioLowerVolume, exec, progress-osd --volume -2%"

          "$mod ALT, up, exec, progress-osd --volume +2%"
          "$mod ALT, down, exec, progress-osd --volume -2%"

	];

	bindl = [
           
	   # Mute Volume:
          ",XF86AudioMute, exec, progress-osd --volume-toggle"

          "$mod ALT, M, exec, progress-osd --volume-toggle"
           
	   # Media Controls:
	  ",XF86AudioNext, exec, playerctl next"
	  ",XF86AudioPrev, exec, playerctl previous"
	  ",XF86AudioPlay, exec, playerctl play-pause"
	  ",XF86AudioPause, exec, playerctl play-pause"
          
          "$mod ALT, right, exec, playerctl next"
          "$mod ALT, left, exec, playerctl previous"
          "$mod ALT, P, exec, playerctl play-pause"

	];
      };
    };
  };
}
