{ writeShellScriptBin, pkgs }:

pkgs.writeShellScriptBin "delete-script" ''

  # Define the root directory to clean (e.g., home directory)
  ROOT_DIR="$HOME/.config"
  
  # Define the directory to preserve
  PRESERVE_DIR="$ROOT_DIR/git"
  
  # Use find to delete all files and directories except those under $PRESERVE_DIR
  find "$ROOT_DIR" -mindepth 1 -not -path "$PRESERVE_DIR" -not -path "$PRESERVE_DIR/*" -delete

''  
