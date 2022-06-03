# tasks/pop.sh
function btask.pop.run() {
	if [ "$1" == '--help' ]; then
		b.get "xp.config.help_message_pop"

		return $(b.get "xp.config.help_message")
	fi

	if [ -n "$1" ]; then
		source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
		exec 6<>/dev/tcp/localhost/6379                    # open the connection

        if [ -n "$2" ]; then
		    redis-cli LRANGE $1 0 -1
        else
		# isOK
		    redis-cli LPOP $1
        fi

		# close the connection
		exec 6>&-
	fi
	return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
