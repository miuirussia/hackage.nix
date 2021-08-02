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
      identifier = { name = "line-drawing"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "© 2019 Francesco Ariis";
      maintainer = "fa-ml@ariis.it";
      author = "Francesco Ariis";
      homepage = "";
      url = "";
      synopsis = "raster line drawing";
      description = "Line drawing algorithms to approximate a\nline segment on discrete graphical media (raster).\nCurrently just Bresenham algorithm.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }