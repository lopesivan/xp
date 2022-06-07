# tasks/s.sh
function btask.s.run() {
	if [ "$1" == '--help' ]; then
		b.get "xp.config.help_message_s"

		return $(b.get "xp.config.help_message")
	fi

    source __REDIS_BASH_LIB__ # include the library
    exec 6<>/dev/tcp/localhost/6379                    # open the connection
    redis-cli keys \* |
    grep 's-'         |
    sort
    exec 6>&-                                          # close the connection
	return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
