_xp()
{
    COMPREPLY=()
    local word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=( $(compgen -W "$(xp commands)" -- "$word") )
    else
        local words=("${COMP_WORDS[@]}")
        # 1 argumento
        if [ ${#words[*]} -lt 5 ]; then
            case x${words[1]} in
                xe|xi|xc|xls|xrm|xcopy|xlink)
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
                xnew)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$( xp new -l "${words[@]}" )
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                ;;
            esac
        else
            # > 1
            case ${words[5]} in
                -y)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$( find . -maxdepth 1 -name \*.yml -type f -printf "%P\n" )
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                ;;
            esac
            case ${words[6]} in
                -y)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$( find . -maxdepth 1 -name \*.yml -type f -printf "%P\n" )
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                ;;
            esac
        fi
    fi
}
complete -F _xp xp
