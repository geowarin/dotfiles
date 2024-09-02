function whoneeds --wraps='comm -12 <(pactree -lru $argv|sort) <(pacman -Qqe|sort) | grep -v' --description 'alias whoneeds comm -12 <(pactree -lru $argv|sort) <(pacman -Qqe|sort) | grep -v'
  comm -12  (pactree -lru $argv|sort | psub) (pacman -Qqe|sort | psub) | grep -v $argv
        
end
