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
      identifier = { name = "constraint-manip"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "Clinton Mead (2017)";
      maintainer = "clintonmead@gmail.com";
      author = "Clinton Mead";
      homepage = "";
      url = "";
      synopsis = "Some conviencience type functions for manipulating constraints.";
      description = "This package contains some useful classes for creating and combining constraints of one variable.\nThe documentation of module has more detail.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."indextype" or (errorHandler.buildDepError "indextype"))
          ];
        buildable = true;
        };
      };
    }