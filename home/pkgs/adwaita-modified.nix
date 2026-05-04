{
  runCommand,
  adwaita-icon-theme,
  gtk3,
}:

runCommand "adwaita-modified"
  {
    nativeBuildInputs = [ gtk3 ];
  }
  ''
    set -euo pipefail

    src=${adwaita-icon-theme}/share/icons/Adwaita
    dst=$out/share/icons/AdwaitaModified

    mkdir -p "$dst"

    for item in "$src/"*; do
      name=$(basename "$item")
      if [[ "$name" != "index.theme" ]] && [[ "$name" != "icon-theme.cache" ]]; then
        ln -s "$item" "$dst/$name"
      fi
    done

    cp "$src/index.theme" "$dst/index.theme"
    chmod u+w "$dst/index.theme"

    sed -i \
        -e 's/^Name=.*/Name=AdwaitaModified/' \
        -e 's/^Inherits=/Inherits=Papirus,/' \
        "$dst/index.theme"

    gtk-update-icon-cache --force "$dst"
  ''
