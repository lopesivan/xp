# tasks/i.sh
function btask.i.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_i"

        return $( b.get "xp.config.help_message" )
    fi

    source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection

    if [ "$1" == '-n' ]; then
        local name=$2
        echo : $name :
        echo : ${LOCALPATH} :
        cat - |
        while read f; do
            redis-client 6 ZADD x-$name 1 $f
            # echo $f
        done | wc -l| sed 's/^.*/add: & lines/'

    else
        redis-client 6 SET $1 $LOCALPATH/$1
    fi

    exec 6>&-                                          # close the connection

    return $?
}

