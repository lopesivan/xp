# tasks/keys.sh
function btask.keys.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_keys"

        return $( b.get "xp.config.help_message" )
    fi

    source ${HOME}/developer/redis-bash/redis-bash-lib  # include the library
    exec 6<>/dev/tcp/localhost/6379                     # open the connection
    redis-cli keys \*
    exec 6>&-                                           # close the connection

    return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
