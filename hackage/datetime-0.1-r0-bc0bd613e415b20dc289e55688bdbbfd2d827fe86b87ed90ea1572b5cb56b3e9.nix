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
      identifier = { name = "datetime"; version = "0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "nubgames@gmail.com";
      author = "Eric Sessoms <nubgames@gmail.com>";
      homepage = "http://github.com/esessoms/datetime";
      url = "";
      synopsis = "Utilities to make Data.Time.* easier to use.";
      description = "Provides several utilities for easily converting among the\nvarious standard library Date and Time types, and for converting\nbetween these and standard external representations.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."QuickCheck" or (errorHandler.buildDepError "QuickCheck"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          ];
        buildable = true;
        };
      };
    }