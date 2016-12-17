# Minimal - Colorful Git Status

An extension to subnixr's minimal zsh theme.

## Installation

Source/load the extension right before `subnixr/minimal`.

An example with [zplug](https://github.com/zplug/zplug):

    MINIMAL_GIT_AHEAD_COLOR=3
    zplug "samhh/minimal-colorful-git-status"
    zplug "subnixr/minimal"
    zplug load

## Configuration

Define all variables _before_ sourcing this plugin/theme.

Colors are mapped to integers identically to the table displayed on the Arch wiki [here](https://wiki.archlinux.org/index.php/zsh#Colors).

- `MINIMAL_GIT_DIRTY_COLOR`: default `1` (red)
- `MINIMAL_GIT_DIVERGED_COLOR`: default `5` (magenta)
- `MINIMAL_GIT_BEHIND_COLOR`: default `4` (blue)
- `MINIMAL_GIT_AHEAD_COLOR`: default `7` (white)
- `MINIMAL_GIT_CLEAN_COLOR`: default `2` (green)
