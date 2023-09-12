{
    root = {
        name = "@root";
        mounts = ["/" "/os_state"];
        params = ["compress=zstd"];
        meta.purpose = "Root partition, should be completely stateless";
        meta.backup = "snapshots";
    };
    blob = {
        name = "@blob";
        mounts = ["/blob"];
        params = ["compress=zstd"];
        meta.purpose = "Large, important files. Downloads, media etc.";
        meta.backup = "full";
    };
    data = {
        name = "@data";
        mounts = ["/data"];
        params = ["compress=zstd"];
        compress = "zstd";
        meta.purpose = "Same as @blob, but small files, configs, etc.";
        meta.backup = "full";
    };
    stash = {
        name = "@stash";
        mounts = ["/stash"];
        params = ["compress=zstd"];
        compress = "zstd";
        meta.purpose = "Replaceable files, downloaded games/music etc.";
        meta.backup = "None";
    };
    cache = {
        name = "@cache";
        mounts = ["/cache"];
        params = ["compress=zstd"];
        compress = "zstd";
        meta.purpose = "Cache files, should be deletable anytime";
        meta.backup = "None";
    };
    swap = {
        name = "@swap";
        mounts = ["/swap"];
        params = ["compress=zstd"];
        compress = "no";
        meta.purpose = "Location for swapfile(s)";
        meta.backup = "None";
        meta.swapfile = "/swap/swapfile";
    };
    nix = {
        name = "@nix";
        mounts = ["/nix"];
        params = ["compress=zstd"];
        compress = "zstd";
        meta.purpose = "Nix (store) location";
        meta.backup = "None";
    };
}
