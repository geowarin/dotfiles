function pacmerge --wraps='sudo p3wm "$(pacnew | fzf)"' --description 'alias pacmerge sudo p3wm "$(pacnew | fzf)"'
  sudo p3wm "$(pacnew | fzf)" $argv
        
end
