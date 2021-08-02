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
      specVersion = "1.6";
      identifier = { name = "repa-examples"; version = "1.0.0.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Ben Lippmeier <benl@ouroborus.net>";
      author = "The DPH Team";
      homepage = "http://trac.haskell.org/repa";
      url = "";
      synopsis = "Examples using the Repa array library.";
      description = "Examples using the Repa array library.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "repa-laplace" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."dph-prim-par" or (errorHandler.buildDepError "dph-prim-par"))
            (hsPkgs."repa" or (errorHandler.buildDepError "repa"))
            ];
          buildable = true;
          };
        "repa-mmult" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."dph-prim-par" or (errorHandler.buildDepError "dph-prim-par"))
            (hsPkgs."repa" or (errorHandler.buildDepError "repa"))
            ];
          buildable = true;
          };
        "repa-fft" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."dph-prim-par" or (errorHandler.buildDepError "dph-prim-par"))
            (hsPkgs."dph-base" or (errorHandler.buildDepError "dph-base"))
            (hsPkgs."repa" or (errorHandler.buildDepError "repa"))
            ];
          buildable = true;
          };
        };
      };
    }