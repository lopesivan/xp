# tasks/add.sh
function btask.add.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_add"

        return $( b.get "xp.config.help_message" )
    fi
    source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection
        redis-client 6 SET $1 $LOCALPATH/$1
    exec 6>&-                                          # close the connection

    return $?
}

