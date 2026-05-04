{ stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "nord-arc";
  version = "unstable-2021-06-22";

  src = fetchFromGitHub {
    owner = "RobVE4";
    repo = "NordArc";
    rev = "441a64dea85a681cd38aa0685ba4fcac72adbd90";
    hash = "sha256-7lvBShWvGNj/qV1yE9MyZBAq0xQKi7RBqb9kam4LJWw=";
  };

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/share/themes
    mkdir -p $out/share/icons
    cp -r $src/NordArc-Theme $out/share/themes
    cp -r $src/NordArc-Icons $out/share/icons
  '';

  meta.description = "NordArc GTK theme";
}
