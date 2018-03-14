# auto_tmux.fish

This function automatically attaches to a tmux session when entering a folder
which contains a file called `.auto_tmux_session`. This file must contain
the name of the session to create and/or attach when entering this folder or any subfolders.

## Usage

The function is executed automatically by fish every time you change directory
because it is defined with the option `--on-variable PWD`.

    jasinai@pc ~ > mkdir my_project
    jasinai@pc ~ > echo my_project_session > my_project/.auto_tmux_session
    jasinai@pc ~ > cd my_project/
    Creating and attaching tmux session 'my_project_session' according to '/home/jasinai/my_project/.auto_tmux_session'
    [ Now inside tmux session ]
    jasinai@pc ~/my_project >
    jasinai@pc ~/my_project > cd ../other_project
    Warning: Need tmux session 'other_project' according to '/home/jasinai/other_project/.auto_tmux_session' but you are currently in 'my_project_session'
    jasinai@pc ~/other_project >

## Installation

Just place `auto_tmux.fish` in `$HOME/.config/fish/conf.d/`
and restart your `fish` shells (or source the file in all open shells).
