# My Linux Workspace Config

My custom configuration for my Linux desktop
workspace. With config files for text editors,
such as neovim, shells, and more.

## Neovim

Custom config using [NvChad](https://nvchad.com/), with additional bindings and LSP support.

### Customization

- To change or add mappings, do it in the [mappings file](nvim/.config/nvim/lua/mappings.lua).

- To configure the options, do it in the [options file](nvim/.config/nvim/lua/options.lua) 

- To add or remove snippets, do it in the [snippets file](nvim/.config/nvim/lua/snippets.lua).

## Zsh

My Z-shell configuration using [Oh my zsh](https://ohmyz.sh/)

---
## instalation

To use configurations from this repository you can copy the files to their intended location.
Alternatively, you can use stow to link each config to its intended path, which is the prefered approach. 

## example

First be sure to have GNU stow installed.

Then, you can just run the following command on the root of the repository, to apply neovim's configuration.

```
stow nvim
```

That should link the configuration to the correct path. You can do the 
same for any other config in this repository - just use the name of the file
that contains the configuration.

---
    
## References

- typecraft

    - [YouTube](https://www.youtube.com/@typecraft_dev)

    - [Hyprland Playlist](https://www.youtube.com/playlist?list=PLsz00TDipIfeDrFeSA56W1wPrYYg_Kd-b)

    - [Neovim Playlist](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn)

    -[GitHub Repo](https://github.com/typecraft-dev/dotfiles/blob/master/hyprland/.config/hypr/hypridle.conf)

- [Hyprland Wiki](https://wiki.hyprland.org/)

- [NvChad Docs](https://nvchad.com/docs/quickstart/install)

- [catppuccin](https://catppuccin.com/)

- [wallpapers](https://github.com/orangci/walls-catppuccin-mocha)

