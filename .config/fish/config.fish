if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    set -gx PATH $PATH $HOME/bin
    # scons
    set -gx PATH $PATH $HOME/.local/bin
end

zoxide init fish | source