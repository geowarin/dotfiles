if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    set -gx PATH $PATH $HOME/bin
    # scons
    set -gx PATH $PATH $HOME/.local/bin

    # Opt out of dotnet telemetry
    set -gx DOTNET_CLI_TELEMETRY_OPTOUT=1

    set -gx EDITOR=code
    set -gx TERM=konsole
    set -gx PAGER=less
end

zoxide init fish | source