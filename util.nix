rec {
    dirEntries = path: builtins.attrNames (builtins.readDir path);
    mapHosts = f: builtins.map f (dirEntries ./hosts);
    mapHostAttrs = key_f: val_f: builtins.listToAttrs (mapHosts (host: {name = key_f host; value = val_f host;}));
}
