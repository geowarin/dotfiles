if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    # set -gx EDITOR code
    # set -gx TERM konsole
    # set -gx PAGER less
end

if type -q zoxide
    zoxide init fish | source
end

set -gx PATH $PATH $HOME/bin
# scons
set -gx PATH $PATH $HOME/.local/bin
# cargo
set -gx PATH $PATH $HOME/.cargo/bin

# npm global
set -gx npm_config_prefix "$HOME/.local"

# Opt out of dotnet telemetry
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1

# pnpm
set -gx PNPM_HOME "/home/geo/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

## Useful aliases
# Replace ls with eza
alias l='eza -l --color=always --hyperlink --group-directories-first --icons'  # long format
alias ls='eza -al --color=always --hyperlink --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --hyperlink --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --hyperlink --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --hyperlink --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles

alias zed='zeditor'
alias g='git'

# Common use
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages
alias update='sudo pacman -Syu'

# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"
# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
