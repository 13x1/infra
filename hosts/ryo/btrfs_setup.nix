{pkgs, ...}:

let
    info = import ./partitions.nix;

in pkgs.writeScriptBin "btrfs_setup" ''#!/usr/bin/env bash
echo ${info.devices.root.path}
''
