# tasks/link.sh
function btask.link.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_link"

        return $( b.get "xp.config.help_message" )
    fi

    if [ -n "$1" ]; then
        source __REDIS_BASH_LIB__ # include the library
        exec 6<>/dev/tcp/localhost/6379                    # open the connection

        if [ $# -eq 1 ]; then
            redis-cli TYPE $1| grep -q 'zset'
            if [ $? -eq 0 ]; then
                redis-cli ZRANGE $1 0 -1 |
                    fzf-tmux |
                        xargs -n1 -I{} ln -s {} $LOCALPATH
            else
                redis-cli get $1 |
                        xargs -n1 -I{} ln -s {} $LOCALPATH
            fi
        fi

        exec 6>&-                                          # close the connection
    fi

    return $?

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
