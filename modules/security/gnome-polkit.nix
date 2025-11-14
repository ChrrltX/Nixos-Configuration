{ config, pkgs, lib, ... }:

{
  options = {
    gnome-polkit.enable = 
      lib.mkEnableOption "enables gnome-polkit";
  };
  
  config = lib.mkIf config.gnome-polkit.enable {

    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = [ pkgs.libsecret ];   

    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };   
    
    environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";

  };  
}
