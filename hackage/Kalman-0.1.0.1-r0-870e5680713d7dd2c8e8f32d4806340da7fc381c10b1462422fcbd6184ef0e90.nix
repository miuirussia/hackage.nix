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
      identifier = { name = "Kalman"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "Dominic Steinitz";
      maintainer = "dominic@steinitz.org";
      author = "Dominic Steinitz";
      homepage = "https://github.com/idontgetoutmuch/Kalman";
      url = "";
      synopsis = "A slightly extended Kalman filter";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."hmatrix" or (errorHandler.buildDepError "hmatrix"))
          ];
        buildable = true;
        };
      };
    }