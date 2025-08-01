{ config, pkgs, lib, ... }:

{ 
  options = {
    virt-manager.enable = 
      lib.mkEnableOption "enables virt-manager";
  };

  config = lib.mkIf config.virt-manager.enable {
     
     virtualisation = {
       libvirtd.enable = true;
       spiceUSBRedirection.enable = true;
     };  

     programs.virt-manager.enable = true;

  };  
}
