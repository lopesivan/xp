# tasks/ls.sh
function btask.ls.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_ls"

        return $( b.get "xp.config.help_message" )
    fi

    source __REDIS_BASH_LIB__ # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection

    if [ $# -eq 1 ]; then
        redis-cli TYPE $1| grep -q 'zset'
        if [ $? -eq 0 ]; then
            redis-cli ZRANGE $1 0 -1
        else
            redis-cli get $1 |
            sed "s/^/`tput bold` /";
        fi
    else
        redis-cli keys \*       |
        sed "s/^/`tput bold` /" |
        cat -n
    fi

    exec 6>&-                                          # close the connection

    return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
