# tasks/copy.sh
function btask.copy.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_copy"

        return $( b.get "xp.config.help_message" )
    fi

    source __REDIS_BASH_LIB__ # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection

    local source=$1
    local destiny=$2
echo $destiny
    [ $1 ] &&
        redis-cli get $source
    echo xargs cp -t ${destiny:=$LOCALPATH}

    exec 6>&- # close the connection

    return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
