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
      specVersion = "1.8";
      identifier = { name = "stepwise"; version = "1.0"; };
      license = "LicenseRef-LGPL";
      copyright = "Arie Middelkoop";
      maintainer = "Arie Middelkoop <ariem@cs.uu.nl>";
      author = "";
      homepage = "http://www.cs.uu.nl/wiki/HUT/WebHome";
      url = "";
      synopsis = "";
      description = "Stepwise monad: stepwise computations, providing resolution of non-deterministic choice, breadth-first search strategies and online results.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "stepwise-benchmark" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."progression" or (errorHandler.buildDepError "progression"))
            (hsPkgs."criterion" or (errorHandler.buildDepError "criterion"))
            ];
          buildable = true;
          };
        };
      };
    }