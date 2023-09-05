# My infrastructure-as-code repo [![built with garnix](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Fgarnix.io%2Fapi%2Fbadges%2F13x1%2Finfra%3Fbranch%3Dmain)](https://garnix.io)

Changes to the system are (or, at least should be) documented here.

# FS structure

See hosts/[host]/partitions.nix.

Formatted disks should be set up with `nix run .#fs_cli -- [host] apply`.

# Hosts

- `ryo`: The newer laptop.
- `arrow`: My old laptop, in use as my 4th monitor.
- `ferris`: My desktop (Ryzen 7 2700x, RTX 2060S)

