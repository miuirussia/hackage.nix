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
      identifier = { name = "haskoin-node"; version = "0.5.2"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "xenog@protonmail.com";
      author = "Jean-Pierre Rupp";
      homepage = "http://github.com/haskoin/haskoin#readme";
      url = "";
      synopsis = "Haskoin Node P2P library for Bitcoin and Bitcoin Cash";
      description = "Bitcoin and Bitcoin Cash peer-to-peer protocol library featuring headers-first synchronisation.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
          (hsPkgs."conduit" or (errorHandler.buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (errorHandler.buildDepError "conduit-extra"))
          (hsPkgs."hashable" or (errorHandler.buildDepError "hashable"))
          (hsPkgs."haskoin-core" or (errorHandler.buildDepError "haskoin-core"))
          (hsPkgs."monad-logger" or (errorHandler.buildDepError "monad-logger"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."nqe" or (errorHandler.buildDepError "nqe"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          (hsPkgs."resourcet" or (errorHandler.buildDepError "resourcet"))
          (hsPkgs."rocksdb-haskell" or (errorHandler.buildDepError "rocksdb-haskell"))
          (hsPkgs."rocksdb-query" or (errorHandler.buildDepError "rocksdb-query"))
          (hsPkgs."string-conversions" or (errorHandler.buildDepError "string-conversions"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."unique" or (errorHandler.buildDepError "unique"))
          (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
          ];
        buildable = true;
        };
      tests = {
        "haskoin-node-test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."haskoin-core" or (errorHandler.buildDepError "haskoin-core"))
            (hsPkgs."haskoin-node" or (errorHandler.buildDepError "haskoin-node"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."monad-logger" or (errorHandler.buildDepError "monad-logger"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."network" or (errorHandler.buildDepError "network"))
            (hsPkgs."nqe" or (errorHandler.buildDepError "nqe"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."rocksdb-haskell" or (errorHandler.buildDepError "rocksdb-haskell"))
            (hsPkgs."unliftio" or (errorHandler.buildDepError "unliftio"))
            ];
          buildable = true;
          };
        };
      };
    }