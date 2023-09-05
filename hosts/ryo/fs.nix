{
    order = [ "root" "boot" ];
    devices = {
        root.path = "/dev/mapper/root";
        boot = { path = "/dev/nvme0n1p1"; mounts = [ "/boot" ]; };
    };
    subvols.root = with import ../../fs/primitives.nix; [ root blob data stash cache swap nix ];
}
