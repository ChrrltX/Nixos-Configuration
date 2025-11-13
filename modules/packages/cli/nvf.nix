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

            statusline = {
              lualine.enable = true;
            };

            telescope.enable = true;
            
            git = {
              #git-conflict.enable = true;
              gitsigns.enable = true;
              #hunk-nvim.enable = true;
            };

            autocomplete = {
              nvim-cmp.enable = true;
            };  

            ui = {
              illuminate.enable = true;
            };

            binds = {
              cheatsheet.enable = true;
            };  

            visuals = {
              cellular-automaton.enable = true;
              cinnamon-nvim.enable = true;
              fidget-nvim.enable = true;
              nvim-cursorline.enable = true;
            };  

            minimap = {
              codewindow.enable = true;
            };  

            presence = {
              neocord.enable = true;
            };

            dashboard = {
              alpha.enable = true;
            };  

            filetree = {
              neo-tree = {
                enable = true;
                setupOpts.enable_git_status = true;
              };
            };  
            
            lsp.enable = true;
            treesitter.enable = true;

            languages = {
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
  };  
}
