{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [ pkgs.flatpak pkgs.flatpak-builder (
      pkgs.python3.withPackages (
        pypkgs: with pypkgs; [
          aiohttp
          toml
        ]
      )
    ) ];

    shellHook = ''
      flatpak install -y org.gnome.Sdk//44 \
        org.gnome.Platform//44 \
        org.freedesktop.Sdk//22.08 \
        org.freedesktop.Platform//22.08 \
        org.freedesktop.Sdk.Extension.rust-stable//22.08
    '';
}