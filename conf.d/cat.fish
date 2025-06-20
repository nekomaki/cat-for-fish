function cat-for-fish
    set state_file /tmp/.cat_state_$USER

    if test -f $state_file
        set state (cat $state_file)

        if test $state -eq 0
            echo "Your cat brought you a new fish as a gift."
            echo 1 > $state_file
        end
    else
        echo "Oops! Your fish was eaten by the cat."
        echo 0 > $state_file
        exec bash
    end
end

if status --is-interactive
    cat-for-fish
end
