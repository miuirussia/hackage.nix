let
  sources = import ./sources {};
  haskell-nix = import sources."haskell.nix" { inherit sources; };
  pkgs = import sources.nixpkgs-unstable haskell-nix.nixpkgsArgs;

  update-index-state-hashes = indexStateHashesPath: with pkgs; with lib; writeShellScriptBin "update-index-state-hashes" ''
    export PATH="${makeBinPath [ coreutils pkgs.haskell-nix.nix-tools.ghc8105 nix curl ]}"

    start=${let ls = attrNames (import indexStateHashesPath); in elemAt ls (length ls - 1)}

    cat ${indexStateHashesPath} | head -n -1

    curl "https://hackage.haskell.org/01-index.tar.gz" --output index.tar.gz --fail-early

    for d in $(seq -f '%.f' $(date -u +%s -d $start) 86400 $(date -u +%s)) ; do
      dt=$(date -u +%Y-%m-%d -d @$d)

      if [[ "''${dt}T00:00:00Z" != "$start" ]]; then
        truncate-index -o ''${dt}-01-index.tar.gz -i index.tar.gz -s "''${dt}T00:00:00Z"
        sha256=$(nix-hash --flat --type sha256 ''${dt}-01-index.tar.gz)
        echo "  \"''${dt}T00:00:00Z\" = \"''${sha256}\";"
      fi
    done

    echo '}'
  '';

  update-index = update-index-state-hashes ./index-state-hashes.nix;
in
{
  inherit pkgs update-index;

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
    ${update-index}/bin/update-index-state-hashes > index-state-hashes.nix
  '';
}
