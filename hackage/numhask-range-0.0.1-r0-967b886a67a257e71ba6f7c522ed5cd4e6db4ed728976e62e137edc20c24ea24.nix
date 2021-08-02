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
      identifier = { name = "numhask-range"; version = "0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Tony Day";
      maintainer = "tonyday567@gmail.com";
      author = "Tony Day";
      homepage = "https://github.com/tonyday567/numhask-range";
      url = "";
      synopsis = "see readme.md";
      description = "see readme.md for description.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."numhask" or (errorHandler.buildDepError "numhask"))
          (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
          (hsPkgs."lens" or (errorHandler.buildDepError "lens"))
          (hsPkgs."foldl" or (errorHandler.buildDepError "foldl"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."linear" or (errorHandler.buildDepError "linear"))
          (hsPkgs."formatting" or (errorHandler.buildDepError "formatting"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."numhask-range" or (errorHandler.buildDepError "numhask-range"))
            (hsPkgs."protolude" or (errorHandler.buildDepError "protolude"))
            (hsPkgs."smallcheck" or (errorHandler.buildDepError "smallcheck"))
            (hsPkgs."tasty" or (errorHandler.buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (errorHandler.buildDepError "tasty-hunit"))
            (hsPkgs."tasty-hspec" or (errorHandler.buildDepError "tasty-hspec"))
            (hsPkgs."tasty-quickcheck" or (errorHandler.buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-smallcheck" or (errorHandler.buildDepError "tasty-smallcheck"))
            (hsPkgs."numhask" or (errorHandler.buildDepError "numhask"))
            ];
          buildable = true;
          };
        };
      };
    }