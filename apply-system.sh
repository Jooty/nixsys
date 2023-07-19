#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild switch -I nixos-config="./home/makima/configuration.nix"
popd