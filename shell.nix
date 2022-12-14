let
    pkgs = import <nixpkgs> {};
in
pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
    buildInputs = (with pkgs; [
        # Rust related dependencies
        rustup
        rust-analyzer
	yarn
	nodejs
	nodePackages.npm

	cmake
	pkg-config
        openssl
	fontconfig

	glib
	gtk3
	libsoup
	webkitgtk
    ]);
    LD_LIBRARY_PATH = with pkgs; "${xorg.libX11}/lib:${xorg.libXcursor}/lib:${xorg.libXrandr}/lib:${xorg.libXi}/lib";
    FONTCONFIG_FILE = with pkgs; "${fontconfig.out}/etc/fonts/fonts.conf";
}
