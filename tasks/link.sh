# tasks/link.sh
function btask.link.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_link"

        return $( b.get "xp.config.help_message" )
    fi

    source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection

    local source=$1
    local destiny=$2

    [ $1 ] &&
        redis-cli get $source |
            xargs -n1 -I{} ln -s {} ${destiny:=$LOCALPATH}

    exec 6>&-                                          # close the connection

    return $?

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
