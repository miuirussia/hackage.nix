{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "cabal2nix"; version = "2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Peter Simons <simons@cryp.to>";
      author = "Peter Simons,\nAndres Loeh,\nBenno Fünfstück,\nMateusz Kowalczyk,\nMathijs Kwik,\nMichael Alan Dorman,\nShea Levy,\nDmitry Malikov,\nEric Seidel,\nNikolay Amiantov,\nAycan iRiCAN,\nJohn Wiegley,\nPhilipp Hausmann,\nSpencer Janssen,\nWilliam Casarin,\nAdam Vogt,\nBryan Gardiner,\nCorey O'Connor,\nCray Elliott,\nFelix Kunzmann,\nGabriel Ebner,\nGergely Risko,\nJohn Albietz,\nJohn Chee,\nJussi Maki,\nMark Laws,\nMark Wotton,\nMatvey Aksenov,\nNicolas Rolland,\nOliver Charles,\nPascal Wittmann,\nPatrick John Wheeler,\nRaymond Gauthier,\nRenzo Carbonara,\nSibi,\nTanner Doshier,\nTom Hunger,\nViktar Basharymau,\ndanbst,\nkarsten gebbert,\nlaMudri,\nАлександр Цамутали";
      homepage = "https://github.com/nixos/cabal2nix#readme";
      url = "";
      synopsis = "Convert Cabal files into Nix build instructions.";
      description = "Convert Cabal files into Nix build instructions. Users of Nix can install the latest version by running:\n> nix-env -i cabal2nix";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."ansi-wl-pprint" or (errorHandler.buildDepError "ansi-wl-pprint"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."distribution-nixpkgs" or (errorHandler.buildDepError "distribution-nixpkgs"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."hackage-db" or (errorHandler.buildDepError "hackage-db"))
          (hsPkgs."language-nix" or (errorHandler.buildDepError "language-nix"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
          (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."SHA" or (errorHandler.buildDepError "SHA"))
          (hsPkgs."split" or (errorHandler.buildDepError "split"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
          ];
        buildable = true;
        };
      exes = {
        "cabal2nix" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."ansi-wl-pprint" or (errorHandler.buildDepError "ansi-wl-pprint"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."distribution-nixpkgs" or (errorHandler.buildDepError "distribution-nixpkgs"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hackage-db" or (errorHandler.buildDepError "hackage-db"))
            (hsPkgs."language-nix" or (errorHandler.buildDepError "language-nix"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."SHA" or (errorHandler.buildDepError "SHA"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            (hsPkgs."cabal2nix" or (errorHandler.buildDepError "cabal2nix"))
            ];
          buildable = true;
          };
        "hackage2nix" = {
          depends = [
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."ansi-wl-pprint" or (errorHandler.buildDepError "ansi-wl-pprint"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."distribution-nixpkgs" or (errorHandler.buildDepError "distribution-nixpkgs"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."hackage-db" or (errorHandler.buildDepError "hackage-db"))
            (hsPkgs."language-nix" or (errorHandler.buildDepError "language-nix"))
            (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            (hsPkgs."pretty" or (errorHandler.buildDepError "pretty"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."SHA" or (errorHandler.buildDepError "SHA"))
            (hsPkgs."split" or (errorHandler.buildDepError "split"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."yaml" or (errorHandler.buildDepError "yaml"))
            (hsPkgs."cabal2nix" or (errorHandler.buildDepError "cabal2nix"))
            (hsPkgs."monad-par" or (errorHandler.buildDepError "monad-par"))
            (hsPkgs."monad-par-extras" or (errorHandler.buildDepError "monad-par-extras"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."stackage-types" or (errorHandler.buildDepError "stackage-types"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        };
      };
    }