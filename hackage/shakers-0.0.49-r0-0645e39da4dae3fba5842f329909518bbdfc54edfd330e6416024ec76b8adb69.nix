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
      specVersion = "1.22";
      identifier = { name = "shakers"; version = "0.0.49"; };
      license = "MIT";
      copyright = "Copyright (C) 2016 Swift Navigation, Inc.";
      maintainer = "Mark Fine <dev@swiftnav.com>";
      author = "Swift Navigation Inc.";
      homepage = "https://github.com/swift-nav/shakers";
      url = "";
      synopsis = "Shake helpers.";
      description = "Primitive helpers for Shake files.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."basic-prelude" or (errorHandler.buildDepError "basic-prelude"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."lifted-base" or (errorHandler.buildDepError "lifted-base"))
          (hsPkgs."shake" or (errorHandler.buildDepError "shake"))
          ];
        buildable = true;
        };
      };
    }