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
      identifier = { name = "digamma"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "bgamari@gmail.com";
      author = "Ben Gamari";
      homepage = "https://github.com/bgamari/digamma";
      url = "";
      synopsis = "A robust implementation of the digamma function";
      description = "An implementation of the digamma function\nbased on Thomas Minka's Matlab code.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."polynomial" or (errorHandler.buildDepError "polynomial"))
          ];
        buildable = true;
        };
      };
    }