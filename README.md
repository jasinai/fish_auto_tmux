# auto_tmux.fish

This function automatically attaches to a tmux session when entering a folder
which contains a file called `.auto_tmux_session`. This file must contain
the name of the session to create and/or attach when entering this folder or any subfolders.

## Installation

Just place `auto_tmux.fish` in `$HOME/.config/fish/conf.d/`
and restart your `fish` shells (or source the file in all open shells).
