{
    root = {
        name = "@root";
        purpose = "Root partition, should be completely stateless";
        backup = "Local only";
        mount = "/";
        additional_mounts = [ "/_state" ];
        compress = "zstd";
    };
    blob = {
        name = "@blob";
        purpose = "Large, important files. Downloads, media etc.";
        backup = "Occasional";
        mount = "/blob";
        compress = "zstd";
    };
    data = {
        name = "@data";
        purpose = "Same as @blob, but small files, configs, etc.";
        backup = "Often";
        mount = "/data";
        compress = "zstd";
    };
    stash = {
        name = "@stash";
        purpose = "Replaceable files, downloaded games/music etc.";
        backup = "None";
        mount = "/stash";
        compress = "zstd";
    };
    cache = {
        name = "@cache";
        purpose = "Cache files, should be deletable anytime";
        backup = "None";
        mount = "/cache";
        compress = "zstd";
    };
    swap = {
        name = "@swap";
        purpose = "Location for swapfile(s)";
        backup = "None";
        mount = "/swap";
        compress = "no";
    };
    nix = {
        name = "@nix";
        purpose = "Nix (store) location";
        backup = "None";
        mount = "/nix";
        compress = "zstd";
    };
}
