# tasks/new.sh
function btask.new.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_new"

        return $( b.get "xp.config.help_message" )
    fi

    if [ "$1" == '-l' ]; then
        find $(dirname $(readlink -f $(which xp)))/tasks/subcmd \
            -name \*.sh \
            -printf "%f\n" |
        sed 's/\.sh$//'    |
        xargs -n1          |
        sort
    else
        b.task.run "$@"
    fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
