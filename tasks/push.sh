# tasks/push.sh
function btask.push.run() {
	if [ "$1" == '--help' ]; then
		b.get "xp.config.help_message_push"

		return $(b.get "xp.config.help_message")
	fi

	source ${HOME}/developer/redis-bash/redis-bash-lib # include the library
	exec 6<>/dev/tcp/localhost/6379                    # open the connection

	if [ "$1" == '-n' ]; then
		local name=$2
		echo : $name :
		echo : ${LOCALPATH} :
		cat - |
			while read f; do
				redis-client 6 RPUSH s-$name "$f"
				# echo $f
			done | wc -l | sed 's/^.*/add: & lines/'

	fi

	exec 6>&- # close the connection
	return $?
}

# vim: set ts=4 sw=4 tw=78 ft=sh: