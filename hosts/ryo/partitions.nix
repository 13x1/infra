#        root.path = "/dev/mapper/root";
#            path = "/dev/nvme0n1p1";

{
    order = [ "root" "boot" ];
    devices = {
        root.path = "/dev/sda2";
        boot = { path = "/dev/sda1"; mounts = [ "/boot" ]; };
    };
    subvols.root = with import ../../fs_primitives.nix; [ root blob data stash cache swap nix ];
}
