function conv-cht
    set url "https://gist.github.com/ParzivalVulpine/16f26c4552ec83f3ab60c79642a2b890/raw"
    curl -sL $url | bat --language=markdown --paging=always
end
