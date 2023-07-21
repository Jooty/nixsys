#!/bin/sh
pushd ~/nixsys
git stage .
sudo nixos-rebuild boot --flake .#makima -p Plasma
popd