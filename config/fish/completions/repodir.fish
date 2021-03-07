for repo in (find ~/dev -mindepth 2 -maxdepth 2 -type d)
    complete -f -c repodir -a "(basename \"$repo\")"
end