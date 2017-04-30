_xp()
{
    COMPREPLY=()
    local word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=( $(compgen -W "$(xp commands)" -- "$word") )
    else
        local words=("${COMP_WORDS[@]}")

        case x${words[1]} in
            xe|xls|xrm|xcopy|xlink)
                unset words[0]
                unset words[$COMP_CWORD]
                local completions=$(xp keys "${words[@]}")
                COMPREPLY=( $(compgen -W "$completions" -- "$word") )
            ;;
            xcp|xln)
                unset words[0]
                unset words[$COMP_CWORD]
                local completions=$(xp x "${words[@]}")
                COMPREPLY=( $(compgen -W "$completions" -- "$word") )
            ;;
            xadd)
                unset words[0]
                unset words[$COMP_CWORD]
                local completions=$( find . -maxdepth 1 -type f -printf "%P\n" )
                COMPREPLY=( $(compgen -W "$completions" -- "$word") )
            ;;
        esac

    fi
}
complete -F _xp xp
