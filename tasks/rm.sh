# tasks/rm.sh
function btask.rm.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_rm"

        return $( b.get "xp.config.help_message" )
    fi

    source __REDIS_BASH_LIB__ # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection
    [ $1 ] &&
        redis-cli del $1
    exec 6>&-                                          # close the connection

    return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
