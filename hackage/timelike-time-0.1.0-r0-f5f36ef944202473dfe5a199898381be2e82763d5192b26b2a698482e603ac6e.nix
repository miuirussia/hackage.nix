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
      identifier = { name = "timelike-time"; version = "0.1.0"; };
      license = "LicenseRef-Apache";
      copyright = "Copyright 2015 Ertugrul Söylemez";
      maintainer = "Ertugrul Söylemez <esz@posteo.de>";
      author = "Ertugrul Söylemez <esz@posteo.de>";
      homepage = "http://hub.darcs.net/esz/timelike-time";
      url = "";
      synopsis = "Timelike interface for the time library";
      description = "This library provides\n<http://hackage.haskell.org/package/timelike timelike> orphan\ninstances for the 'UTCTime' and 'ZonedTime' from the\n<http://hackage.haskell.org/package/time time library>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."timelike" or (errorHandler.buildDepError "timelike"))
          (hsPkgs."transformers" or (errorHandler.buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }