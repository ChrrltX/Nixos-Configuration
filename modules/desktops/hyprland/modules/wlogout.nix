{ pkgs, lib, config, ... }:

{
  options = {
    wlogout.enable = 
      lib.mkEnableOption "enables wlogout";
  };
  
  config = lib.mkIf config.wlogout.enable {

    home-manager.users.chrrltx = { pkgs, ... }: {

      programs.wlogout = {
        enable = true;
        
        layout = [
          { label = "lock"; action = "hyprlock"; text = "Lock"; keybind = "L"; }
          { label = "shutdown"; action = "systemctl poweroff"; text = "Shutdown"; keybind = "S"; }
          { label = "reboot"; action = "systemctl reboot"; text = "Reboot"; keybind = "R"; }
        ];

        style = ''
          * {
            background-image: none;
            box-shadow: none;
          }
          window {
            background-color: rgba(30, 30, 46, 0.90);
          }
          button {
            border-radius: 0px;
            border-color: #f38ba8;
            text-decoration-color: #cdd6f4;
            color: #cdd6f4;
            background-color: #181825;
            border-style: solid;
            border-width: 3px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 40%;
            margin: 5px;
          }
          button:focus, button:active, button:hover {
            background-color: rgb(48, 50, 66);
            outline-style: none;
          }
          #lock {
            background-image: url("/home/ea/.config/wlogout/icons/lock.svg");
          }
          #shutdown {
            background-image: url("/home/ea/.config/wlogout/icons/shutdown.svg");
          }
          #reboot {
            background-image: url("/home/ea/.config/wlogout/icons/reboot.svg");
          }
        '';
      };

    };
  };
}   
