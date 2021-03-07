# git clone into `~/dev/` with dir structure like `githosting/org/repo`
function gtc
    git clone $argv[1] (string join '' '~/dev/' (string replace '.git' '' $argv[1]))
end