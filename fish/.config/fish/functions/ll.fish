function ll --wraps=ls --wraps='lsa -lA' --description 'alias ll=lsd -lA'
    lsd -lA $argv

end
