# tasks/pop.sh
function btask.pop.run() {
	if [ "$1" == '--help' ]; then
		b.get "xp.config.help_message_pop"

		return $(b.get "xp.config.help_message")
	fi

	if [ -n "$1" ]; then
		source __REDIS_BASH_LIB__ # include the library
		exec 6<>/dev/tcp/localhost/6379                    # open the connection

		# isOK
		redis-cli LPOP $1

		# close the connection
		exec 6>&-
	fi
	return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
