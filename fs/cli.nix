{util, pkgs, ...}:

let
    allHosts = util.mapHosts (f: f);
    managedHosts = builtins.filter (h: (builtins.readDir ../hosts/${h}) ? "fs.nix") allHosts;
    hostApps = map (host: pkgs.callPackage ./btrfs_setup.nix {
        inherit host util;
        fs = import ../hosts/${host}/fs.nix;
    }) managedHosts;
in pkgs.writeShellApplication {
    name = "fs_cli";
    runtimeInputs = hostApps;
    text = ''
        set +u

        host=$1
        command=$2

        if [ -z "$host" ] || [ -z "$command" ]; then
            echo "
            usage: fs_cli <host> <command>
            commands:
              show: prints the setup script
              apply: runs the setup script
            "
            exit 1
        fi

        if [ "$command" = "show" ]; then
            cat "$(which "btrfs_setup_$host")"
        elif [ "$command" = "apply" ]; then
            eval "$(which "btrfs_setup_$host")"
        else
            echo "unknown command $command"
            exit 1
        fi
    '';
}
