# hackage.nix
Automatically generated Nix expressions for Hackage

# How to update (Automation in progress)
```
nix-shell -p pkgs.haskell-nix.internal-cabal-install -p pkgs.haskell-nix.update-index-state-hashes -p pkgs.haskell-nix.internal-nix-tools
cabal update
hackage-to-nix .
update-index-state-hashes > index-state-hashes.nix
```

# Inspired by
[input-output-hk/hackage.nix](https://github.com/input-output-hk/hackage.nix)
