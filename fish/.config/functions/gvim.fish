function gvim --wraps='nvim --listen /tmp/godothost' --description 'alias gvim=nvim --listen /tmp/godothost'
  nvim --listen /tmp/godothost $argv
        
end
