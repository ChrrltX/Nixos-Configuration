{ config, pkgs, lib, inputs, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {
    wayland.windowManager.hyprland = {
      settings = {

	windowrule = [
	   
	   # Other Stuff and Fixes:
	  #"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
	  #"suppressevent maximize, class:.*"

	  #"center, floating:1, xwayland:0"
	
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

	  "fullscreen,class:^steam_app\\d+$"
	  "monitor 1,class:^steam_app\\d+$"
	  "workspace 10,class:^steam_app\\d+$"

	  "immediate, class:^(steam_app)"
	  "immediate, title:.*minecraft.*"
	  "immediate, title:.*\.exe"

	];

      };
    };
  };
}
