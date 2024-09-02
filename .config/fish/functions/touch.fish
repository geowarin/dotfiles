function touch --wraps='mkdir -p "$(dirname "$1")" && /usr/bin/touch "$1"' --description 'alias touch mkdir -p "$(dirname "$1")" && /usr/bin/touch "$1"'
  mkdir -p "$(dirname $argv)" && /usr/bin/touch $argv
        
end
