{
    devices = {
        root = {
            path = "/dev/mapper/root";
        };
        boot = {
            path = "/dev/nvme0n1p1";
            mount = "/boot";
        };
    };
    partitions = [
         {
             name = "@blob";
             purpose = "Large, important files. Downloads, media etc.";
             backup = "Occasional";
             mount = "/blob";
             compress = "zstd";
         }
         {
             name = "@data";
             purpose = "Same as @blob, but small files, configs, etc.";
             backup = "Often";
             mount = "/data";
             compress = "zstd";
         }
         {
             name = "@stash";
             purpose = "Replaceable files, downloaded games/music etc.";
             backup = "None";
             mount = "/stash";
             compress = "zstd";
         }
         {
             name = "@cache";
             purpose = "Cache files, should be deletable anytime";
             backup = "None";
             mount = "/cache";
             compress = "zstd";
         }
         {
             name = "@swap";
             purpose = "Location for swapfile(s)";
             backup = "None";
             mount = "/swap";
             compress = "no";
         }
         {
             name = "@root";
             purpose = "Root partition, should be completely stateless";
             backup = "Local only";
             mount = "/";
             compress = "zstd";
         }
         {
             name = "@nix";
             purpose = "Nix (store) location";
             backup = "None";
             mount = "/nix";
             compress = "zstd";
         }
    ];
}
