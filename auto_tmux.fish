# Place this file on ~/.config/fish/conf.d/

if status --is-interactive
    # Only start tmux automatically when running an interactive shell
    function auto_tmux --on-variable PWD -d 'Automatically attach to a tmux session when entering direcories containing a .auto_tmux_session file'
        set -l session_file_name ".auto_tmux_session"
        set -l current_dir "$PWD"
        while test "$current_dir" != "/" -a "$current_dir" != ""
            set -l session_file "$current_dir/$session_file_name"
            if test -f "$session_file"
                set -l required_session (cat "$session_file")
                set -l current_session (tmux list-panes -a -F '#{pane_tty} #{session_name}' | grep (tty) | awk '{print $2}')
                if test "$required_session" != ""
                    if test "$current_session" != "$required_session"
                        if test "$current_session" = ""
                            if not tmux has-session -t "$required_session" 2> /dev/null
                                echo "Creating and attaching tmux session '$required_session' according to '$session_file'"
                                if not tmux new-session -A -s "$required_session"
                                    echo "Error creating session!"
                                    return 1
                                end
                            else
                                echo "Attaching tmux session '$required_session' according to '$session_file'"
                                if not tmux attach-session -t "$required_session"
                                    echo "Error attaching session!"
                                    return 1
                                end
                            end
                        else
                            echo "Warning: Need tmux session '$required_session' according to '$session_file' but you are currently in '$current_session'"
                        end
                    else
                        # Already in correct session, do nothing.
                    end
                end
                return 0
            end
            set -l current_dir (dirname "$current_dir")
        end
    end
end
