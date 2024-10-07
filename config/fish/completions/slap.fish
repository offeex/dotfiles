# slap fish shell completion

function __fish_slap_no_subcommand --description 'Test if there has been any subcommand yet'
    for i in (commandline -opc)
        if contains -- $i
            return 1
        end
    end
    return 0
end

complete -c slap -n '__fish_slap_no_subcommand' -f -l cd -d 'cd into the created directory'
complete -c slap -n '__fish_slap_no_subcommand' -f -l help -s h -d 'show help'
complete -c slap -n '__fish_slap_no_subcommand' -f -l version -s v -d 'print the version'
