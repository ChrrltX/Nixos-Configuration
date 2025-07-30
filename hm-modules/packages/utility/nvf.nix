{ config, pkgs, lib, ... }:

{
  options = {
    nvf.enable = 
      lib.mkEnableOption "enables nvf";
  };
  
  config = lib.mkIf config.nvf.enable {
  
    vim = {
      
      theme.enable = true;

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      launguages = {

        enableLSP = true;

	nix.enable = true;
	python.enable = true;
	clang.enable = true;
	lua.enable = true;
	ts.enable = true;
	rust.enable = true;
      
      };

    };

  };  
}
