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
      specVersion = "1.12";
      identifier = { name = "emd"; version = "0.1.5.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) Justin Le 2018";
      maintainer = "justin@jle.im";
      author = "Justin Le";
      homepage = "https://github.com/mstksg/emd#readme";
      url = "";
      synopsis = "Empirical Mode Decomposition and Hilbert-Huang Transform";
      description = "Please see the README on GitHub at <https://github.com/mstksg/emd#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."binary" or (errorHandler.buildDepError "binary"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."data-default-class" or (errorHandler.buildDepError "data-default-class"))
          (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
          (hsPkgs."finite-typelits" or (errorHandler.buildDepError "finite-typelits"))
          (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
          (hsPkgs."ghc-typelits-natnormalise" or (errorHandler.buildDepError "ghc-typelits-natnormalise"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          (hsPkgs."typelits-witnesses" or (errorHandler.buildDepError "typelits-witnesses"))
          (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
          (hsPkgs."vector-sized" or (errorHandler.buildDepError "vector-sized"))
          ];
        buildable = true;
        };
      tests = {
        "emd-test" = {
          depends = [
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."emd" or (errorHandler.buildDepError "emd"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "emd-bench" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            (hsPkgs."deepseq" or (errorHandler.buildDepError "deepseq"))
            (hsPkgs."emd" or (errorHandler.buildDepError "emd"))
            (hsPkgs."ghc-typelits-knownnat" or (errorHandler.buildDepError "ghc-typelits-knownnat"))
            (hsPkgs."mwc-random" or (errorHandler.buildDepError "mwc-random"))
            (hsPkgs."pure-fft" or (errorHandler.buildDepError "pure-fft"))
            (hsPkgs."vector" or (errorHandler.buildDepError "vector"))
            (hsPkgs."vector-sized" or (errorHandler.buildDepError "vector-sized"))
            ];
          buildable = true;
          };
        };
      };
    }