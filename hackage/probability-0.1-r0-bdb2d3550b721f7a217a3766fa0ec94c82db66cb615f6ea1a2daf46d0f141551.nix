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
      specVersion = "1.0";
      identifier = { name = "probability"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Martin Erwig <erwig@eecs.oregonstate.edu>";
      homepage = "http://darcs.haskell.org/probability";
      url = "";
      synopsis = "Computations with discrete random variables";
      description = "The Library allows exact computation with discrete random variables\nin terms of their distributions by using a monad.\nThe monad is similar to the List monad for non-deterministic computations,\nbut extends the List monad by a measure of probability.\nSmall interface to R plotting.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          ];
        buildable = true;
        };
      };
    }