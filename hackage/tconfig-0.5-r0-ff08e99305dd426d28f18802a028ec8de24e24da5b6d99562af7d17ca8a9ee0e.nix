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
      specVersion = "1.2";
      identifier = { name = "tconfig"; version = "0.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "DiscipleRayne@gmail.com";
      author = "Anthony Simpson";
      homepage = "";
      url = "";
      synopsis = "Simple text configuration file parser library.";
      description = "This Library can be used to keep track of simple information\nin simple games and other programs.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }