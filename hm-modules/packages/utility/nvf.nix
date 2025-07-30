{ config, pkgs, lib, ... }:

{
  options = {
    nvf.enable = 
      lib.mkEnableOption "enables nvf";
  };
  
  config = lib.mkIf config.nvf.enable {

    #home-manager.users.chrrltx = { pkgs, ... }: {  

      programs.nvf = {
      
        enable = true;

        settings = {

          vim = {
      
            theme.enable = true;

            statusline.lualine.enable = true;
            telescope.enable = true;
            autocomplete.nvim-cmp.enable = true;
            spellcheck.enable = true;

            presence = {
              neocord.enable = true;
            };  

            dashboard = {
              alpha.enable = true;
            };  

            filetree.neo-tree = {
              enable = true;
              setupOpts.enable_git_status = true;
            }; 

            languages = {
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

      };
    #};  
  };  
}
