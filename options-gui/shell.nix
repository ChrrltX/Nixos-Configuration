{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "python-gtk-app";
  nativeBuildInputs = [
    pkgs.gobject-introspection
    pkgs.gtk3
    pkgs.gst_all_1.gstreamer
  ];
  buildInputs = [
    (pkgs.python3.withPackages (ps: with ps; [
      pkgs.python3.pkgs.pygobject3
      pkgs.python3.pkgs.gst-python
    ]))
  ];
}   
