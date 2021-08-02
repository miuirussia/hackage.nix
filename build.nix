let
  sources = import ./sources {};
  haskell-nix = import sources."haskell.nix" {};
  pkgs = let
    args = haskell-nix.nixpkgsArgs // {
      config = {};
      overlays = haskell-nix.overlays;
    };
  in
    import sources.nixpkgs-unstable args;
in
{
  inherit pkgs;

  update-hackage = with pkgs; with lib; writeScript "update-hackage-nix.sh" ''
    #!${stdenv.shell}

    set -euo pipefail
    export PATH="${makeBinPath ([ coreutils curl findutils gawk bash git openssh pkgs.haskell-nix.nix-tools.ghc8105 cabal-install nix-prefetch-git ])}"

    set -x
    echo "Updating local hackage index..."
    cabal update

    echo "Running hackage-to-nix..."
    hackage-to-nix .

    echo "Running update-index-state-hashes..."
    ${pkgs.haskell-nix.update-index-state-hashes}/bin/update-index-state-hashes > index-state-hashes.nix
  '';
}
