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
      identifier = { name = "Jazzkell"; version = "0.0.1"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2019 Donya Quick";
      maintainer = "Donya Quick <donyaquick@gmail.com>";
      author = "Donya Quick <donyaquick@gmail.com>";
      homepage = "http://www.donyaquick.com/generative-jazz";
      url = "";
      synopsis = "Library for modeling jazz improvisation.";
      description = "Jazzkell is a Haskell implementation of a functional model for\njazz improvisation.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."Euterpea" or (errorHandler.buildDepError "Euterpea"))
          (hsPkgs."random" or (errorHandler.buildDepError "random"))
          ];
        buildable = true;
        };
      };
    }