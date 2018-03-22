YARN_AUTO_COMP_PATH="$ZSH_CUSTOM/plugins/yarn-autocompletions/yarn-autocompletions"

function _fetch_yarn_autocompletions_result () {
    compls=$($YARN_AUTO_COMP_PATH $1)
    completions=(${=compls})
    compadd -- $completions
}

function _yarn_autocompletions () {
    case $words[2] in
        add)
            if [[ $words[3] == "--dev" ]]
            then
                _fetch_yarn_autocompletions_result "add-dev"
            else
                _fetch_yarn_autocompletions_result "add"
            fi
            ;;
        remove)
            _fetch_yarn_autocompletions_result "remove"
            ;;
        *)
            _fetch_yarn_autocompletions_result "scripts"
            ;;
    esac
}

compdef _yarn_autocompletions yarn
