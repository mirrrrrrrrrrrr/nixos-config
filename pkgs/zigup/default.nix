{
  stdenv,
  fetchurl,
  lib,
  ...
}:
stdenv.mkDerivation rec {
  pname = "zigup";
  version = "latest";

  src = fetchurl {
    url = "https://github.com/marler8997/zigup/releases/latest/download/zigup-x86_64-linux.tar.gz";
    sha256 = "08jma27gc8paq5mh0cfqh4hi52accf498z6i76p4na1lk8vdh4ql";
  };

  unpackPhase = ''
    tar -xzf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp zigup $out/bin
    chmod +x $out/bin/zigup
  '';

  meta = with lib; {
    description = "Zig version manager";
    homepage = "https://github.com/marler8997/zigup";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
