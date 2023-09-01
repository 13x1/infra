# My infrastructure-as-code repo

Changes to the system are (or, at least should be) documented here.

## FS structure

See hosts/[host]/partitions.nix.

Formatted disks should be set up with `nix run .#btrfs_setup_[host]`.
