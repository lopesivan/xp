# tasks/e.sh
function btask.e.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_e"

        return $( b.get "xp.config.help_message" )
    fi

    if [ -n "$1" ]; then
        source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
        exec 6<>/dev/tcp/localhost/6379                    # open the connection
        redis-cli get $1 | xargs vim
        exec 6>&-                                          # close the connection
    fi

    return $?

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
