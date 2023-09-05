# My infrastructure-as-code repo

Changes to the system are (or, at least should be) documented here.

# FS structure

See hosts/[host]/partitions.nix.

Formatted disks should be set up with `nix run .#fs_cli -- [host] apply`.

# Hosts

- `ryo`: The newer laptop.
- `arrow`: My old laptop, in use as my 4th monitor.
- `ferris`: My desktop (Ryzen 7 2700x, RTX 2060S)

