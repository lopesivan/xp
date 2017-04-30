# tasks/completions.sh
function btask.completions.run() {
    if [ "$1" == '--help' ]; then
        b.get "xp.config.help_message_completions"

        return $( b.get "xp.config.help_message" )
    fi

    echo --help --version --usage \
        -a --add                  \
        -l --list                 \
        -n --name                 \
    |
    sed 's/ /\n/g'
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
