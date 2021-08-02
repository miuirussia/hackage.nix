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
      specVersion = "2.4";
      identifier = { name = "bitcoind-regtest"; version = "0.1.0.0"; };
      license = "ISC";
      copyright = "";
      maintainer = "ics@gambolingpangolin.com";
      author = "Ian Shipman";
      homepage = "https://github.com/GambolingPangolin/bitcoind-rpc";
      url = "";
      synopsis = "A library for working with bitcoin-core regtest networks";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bitcoind-rpc" or (errorHandler.buildDepError "bitcoind-rpc"))
          (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
          (hsPkgs."haskoin-core" or (errorHandler.buildDepError "haskoin-core"))
          (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
          (hsPkgs."process" or (errorHandler.buildDepError "process"))
          (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
          (hsPkgs."servant-client" or (errorHandler.buildDepError "servant-client"))
          (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      tests = {
        "bitcoind-rpc-tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bitcoind-rpc" or (errorHandler.buildDepError "bitcoind-rpc"))
            (hsPkgs."cereal" or (errorHandler.buildDepError "cereal"))
            (hsPkgs."haskoin-core" or (errorHandler.buildDepError "haskoin-core"))
            (hsPkgs."http-client" or (errorHandler.buildDepError "http-client"))
            (hsPkgs."process" or (errorHandler.buildDepError "process"))
            (hsPkgs."servant" or (errorHandler.buildDepError "servant"))
            (hsPkgs."servant-client" or (errorHandler.buildDepError "servant-client"))
            (hsPkgs."temporary" or (errorHandler.buildDepError "temporary"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."bitcoind-regtest" or (errorHandler.buildDepError "bitcoind-regtest"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        };
      };
    }