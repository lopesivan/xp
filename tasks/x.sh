# tasks/x.sh
function btask.x.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_x"

        return $( b.get "xp.config.help_message" )
    fi

    source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection
    redis-cli keys \* |
    grep 'x-'         |
    sort
    #sed -e "s/[0-9]\+\s\+/&`tput bold`/" -e "s/$/`tput rmso`/"
    exec 6>&-                                          # close the connection

    return $?

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
