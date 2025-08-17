{ config, pkgs, lib, ... }:

{
  home-manager.users.chrrltx = { pkgs, ... }: {

    wayland.windowManager.hyprland = {
      
      settings = {
         
	 # Bind Wofi:
        "$menu" = "wofi --show drun";

        bind = [ "$mod, Space, exec, $menu" ];

      };

    };  

    stylix.targets.wofi.enable = false;

    programs.wofi = {
      
      enable = true;
      
      settings = {
      
        promt = "Search";
	allow_images = true;
        width = 500;
        height = 400;
        show = "Search";
        term = "kitty";
        hide_scroll = true;
        print_command = true;
        insensitive = true;
        columns = 1;
        no_actions = true;
	matching = "fuzzy";

      };	

      style = ''
        
        @keyframes fadeIn {
          0% {
          }
          100% {
          }
        }
        
        * {
          all:unset;
          font-family: 'JetBrainsMono Nerd Font Mono', monospace;
          font-size: 18px;
          outline: none;
          border: none;
          border-radius: 10px;
          text-shadow:none;
          background-color: rgba(30, 30, 46, 0.5);
          color: rgba(30, 30, 46, 0.5);
        }

        window {
          all:unset;
          padding: 20px;
          border-radius: 10px;
          background-color: rgba(30, 30, 46, 0.5);
        }
        
        #inner-box {
          margin: 2px;
          padding: 5px
          border: none;
          background-color: rgba(30, 30, 46, 0.5);
        }
        
        #outer-box {  
          background-color: rgba(30, 30, 46, 0.5);
          border: none;
        }
        
        #scroll {
          margin: 0px;
          border: none;
          background-color: transparent;
        }
        
        #input {
          all:unset;
          margin-left:20px;
          margin-right:20px;
          margin-top:20px;
          padding: 20px;
          border: none;
          outline: none;
          color: @text;
          box-shadow: 1px 1px 5px rgba(0,0,0, .5);
          border-radius:10;
          background-color: rgba(30, 30, 46, 0.7);
        }
        
        #input image {
          border: none;
          color: rgb(243, 139, 168);
          padding-right:10px;
        }
        
        #input * {
          border: none;
          outline: none;
        }

        #input:focus {
          outline: none;
          border: none;
          border-radius:10;
        }
        
        #text {
          margin: 5px;
          border: none;
          color: @text;
          outline: none;
          background-color: transparent;
        }
        
        #entry {
          border: none;
          margin: 5px;
          padding: 10px;
          background-color: rgba(30, 30, 46, 0.5);
          color: rgba(30, 30, 46, 0.5);
        }
        
        #entry arrow {
          border: none;
          color: rgb(180, 190, 254);
          background-color: rgba(30, 30, 46, 0.5);
        }
        
        #entry:selected {
          border: none;
          border-radius: 20px;
          background-color: rgb(203, 166, 247);
          color: transparent;
        }
        
        #entry:selected #text {
          color: @text;
        }
        
        #entry:drop(active) {
          background-color: rgb(180, 190, 254) !important;
        }

        #img {
          background-color: transparent;
        }  

      '';
    };   

  };
}
