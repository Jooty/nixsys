#!/bin/sh
pushd ~/nixsys
sudo nixos-rebuild boot --flake .#makima -p Hyprland
popd