{ config, pkgs, lib, ... }:

{
  options = {
    hyprshell.enable = 
      lib.mkEnableOption "enables hyprshell";
  };
  
  config = lib.mkIf config.hyprshell.enable {
  
    home-manager.users.chrrltx = { pkgs, ... }: {

      home.packages = with pkgs; [ hyprshell ];
      
      home.file."~/.config/hyprshell/config.toml".text = ''
        
        layerrules = true
        kill_bind = "ctrl+shift+alt, h"

        [launcher]
        default_terminal = "kitty"
        width = 650
        max_items = 7
        show_when_empty = true
        animate_launch_ms = 250

        [launcher.plugins.applications]
        run_cache_weeks = 8
        show_execs = true
        show_actions_submenu = false

        [launcher.plugins.terminal]

        [[launcher.plugins.websearch.engines]]
        url = "https://search.brave.com/search?q={}"
        name = "Brave"
        key = "b"

        [[launcher.plugins.websearch.engines]]
        url = "https://chatgpt.com/?q={}"
        name = "ChatGpt"
        key = "c"

        [[launcher.plugins.websearch.engines]]
        url = "https://www.youtube.com/results?search_query={}"
        name = "YouTube"
        key = "y"

        [launcher.plugins.calc]

        [windows]
        scale = 8.5
        workspaces_per_row = 5
        strip_html_from_workspace_title = true

        [windows.overview.open]
        key = "tab"
        modifier = "ctrl"

        [windows.overview.navigate]
        forward = "tab"

        [windows.overview.navigate.reverse]
        mod = "shift"

        [windows.overview.other]
        filter_by = []
        hide_filtered = false

        [windows.switch.open]
        modifier = "alt"

        [windows.switch.navigate]
        forward = "tab"

        [windows.switch.navigate.reverse]
        mod = "shift"

        [windows.switch.other]
        filter_by = []
        hide_filtered = true

      '';

    };
  };  
}

