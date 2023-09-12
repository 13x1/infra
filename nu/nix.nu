export def open-nix [file: path] {
    nix eval --json -f $file | from json
}

export def call-nix [expr: string] {
    echo expr | nix eval --json --impure -f - | from json
}

export def 'from nix' [] {
    nix eval --json --impure -f - | from json
}

export def 'to nix' [] {
    let escaped = (
        $in |
        to json |
        str replace -a "\\\\" "\\\\" |
        str replace -a "\'" "\\\'" |
        str replace -a "\"" "\\\"" |
        str replace -a "\\$" "\\$"
    )
    $"builtins.fromJSON \"($escaped)\""
}