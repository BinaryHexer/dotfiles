# find (using ripgrep & peco) and open file in vim
function vrg
  set EX_CMD (
        set FL 0
        while read -d : -l fn ln line
            if test $FL = "0"
                printf "e %s" "$fn"
                set FL 1
            else
                printf "|tabnew %s" "$fn"
            end
            printf "|silent :%d" "$ln"
        end < (rg -n "$argv[1]" | peco --select-1 | psub)
    )
    if test -n "$EX_CMD"
      vim -c "$EX_CMD"
    end
end