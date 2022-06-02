# tasks/project.sh
function btask.project.run() {
    echo project
    # if [ "$1" == '--help' ]; then
    #     b.get "xp.config.help_message_project"

    #     return $( b.get "xp.config.help_message" )
    # fi


    xp.oproject.load
    b.opt.init "$@"

    if b.opt.has_flag? --debug; then

        # --list| -l
        if b.opt.has_flag? --list; then
            echo "list ON"
        else
            echo "list OFF"
        fi
        # --name| -n
        if b.opt.check_required_args; then
            local name="$(b.opt.get_opt --name)"
            echo NAME=$name
        fi
        # --package| -p
        if b.opt.check_required_args; then
            local package="$(b.opt.get_opt --package)"
            echo package=$package
        fi

        return 1
    fi

    if b.opt.has_flag? --help; then
        b.opt.show_usage
        return 1
    fi

    ##############################################################################
    ##############################################################################
    ##############################################################################

    dir=~/.vim/templates/b/project

    file=$(
    find ${dir}/ -type f -name cmd.\*.md|
        sort |
        while read doc; do
            head $doc               |
                sed  -n '1,/^=\{64\}/p' |
                sed -e '1d' -e '$d'     |
                sed.joinlines           |
                sed 's/  */ /g'         |
                sed 's/^/\t/'
        done |
            nl -s: |
            fzf-tmux -l 100% --multi --reverse  --select-1 --exit-0
        )

        #[ -n "$file" ] || exit 1
        [ -n "$file" ] || {
            exit 1
    }

    N=$(echo $file| cut -d: -f1)
    echo $N

    cd $LOCALPATH

    # --name| -n
    if b.opt.check_required_args; then
        local name="$(b.opt.get_opt --name)"
        local package="$(b.opt.get_opt --package)"

        find ${dir}/ -type f -name cmd.\*.md|
            sort |
                while read doc; do
                    let count++
                    if [ $count -eq $N ]; then
                        echo $doc
                        break
                    fi
                done |
        xargs -Ifile sed -n '/^#/p' file|
            sed 's/^#//' |
            sed "s/__NAME__/$name/" |
            sed "s/__PACKAGE__/$package/" |
            sh
    fi

    return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
