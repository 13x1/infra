# Config for future iterations of the setup tool
{
    boot = {
        name = "Boot partition";
        partition = "/dev/sda1";
        filesystem = "fat32";
        mounts = ["/boot"];
    };
    root = {
        name = "Root partition";
        partition = "/dev/nvme0n1p1";
        filesystem = "btrfs";
        subvols = with import ../../fs/primitives.nix; [
            root blob data stash cache swap nix
        ];
    };
}