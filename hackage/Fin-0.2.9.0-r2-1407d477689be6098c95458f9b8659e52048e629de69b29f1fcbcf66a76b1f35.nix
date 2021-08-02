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
      identifier = { name = "Fin"; version = "0.2.9.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "strake888@gmail.com";
      author = "M Farkas-Dyck";
      homepage = "";
      url = "";
      synopsis = "Finite totally-ordered sets";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."peano" or (errorHandler.buildDepError "peano"))
          (hsPkgs."alg" or (errorHandler.buildDepError "alg"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."foldable1" or (errorHandler.buildDepError "foldable1"))
          (hsPkgs."natural-induction" or (errorHandler.buildDepError "natural-induction"))
          (hsPkgs."universe-base" or (errorHandler.buildDepError "universe-base"))
          ];
        buildable = true;
        };
      };
    }