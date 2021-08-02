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
      identifier = { name = "order-maintenance"; version = "0.2.1.0"; };
      license = "BSD-3-Clause";
      copyright = "© 2014–2015 Denis Firsov; © 2014–2017 Wolfgang Jeltsch";
      maintainer = "wolfgang-it@jeltsch.info";
      author = "Wolfgang Jeltsch";
      homepage = "http://hackage.haskell.org/package/order-maintenance";
      url = "http://hackage.haskell.org/package/order-maintenance-0.2.1.0/order-maintenance-0.2.1.0.tar.gz";
      synopsis = "Algorithms for the order maintenance problem with a safe\ninterface";
      description = "This package is about order maintenance.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."cabal-test-quickcheck" or (errorHandler.buildDepError "cabal-test-quickcheck"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
            (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
            (hsPkgs."order-maintenance" or (errorHandler.buildDepError "order-maintenance"))
            ];
          buildable = true;
          };
        };
      };
    }