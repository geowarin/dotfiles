function whoowns --wraps='pacman -Qo "$1"' --description 'alias whoowns pacman -Qo "$1"'
  pacman -Qo $argv
        
end
