# tasks/add.sh
function btask.add.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_add"

        return $( b.get "xp.config.help_message" )
    fi

    source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection

    if [ "$1" == '-n' ]; then
        local name=$2
        echo : $name :
        echo : ${LOCALPATH} :
        # for f in ${LOCALPATH}/*; do
        #     test -f $f && redis-client 6 ZADD x-$name 1 $f
        # done | wc -l| sed 's/^.*/add: & files/'
        find ${LOCALPATH}/ -type f -not -path '*/\.git/*' |
        grep -v '\.pyc$' |
        while read f; do
            redis-client 6 ZADD x-$name 1 $f
            # echo $f
        done | wc -l| sed 's/^.*/add: & files/'

    else
        redis-client 6 SET $1 $LOCALPATH/$1
    fi

    exec 6>&-                                          # close the connection

    return $?
}

