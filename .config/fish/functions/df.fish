function df --wraps='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' --description 'alias df git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
  git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $argv
        
end
