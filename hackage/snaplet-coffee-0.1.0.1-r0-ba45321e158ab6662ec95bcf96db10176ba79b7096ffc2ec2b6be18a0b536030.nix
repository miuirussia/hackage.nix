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
      identifier = { name = "snaplet-coffee"; version = "0.1.0.1"; };
      license = "GPL-3.0-only";
      copyright = "Copyright (C) 2013 Kevin van Rooijen";
      maintainer = "kevin.van.rooijen@gmail.com";
      author = "Kevin van Rooijen";
      homepage = "https://github.com/AtticHacker/snaplet-coffee";
      url = "";
      synopsis = "CoffeeScript for Snap, auto-compilation and pre-compilation.";
      description = "A simple snaplet based off of 'snaplet-fay' but for CoffeeScript.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."snap-core" or (errorHandler.buildDepError "snap-core"))
          (hsPkgs."snap" or (errorHandler.buildDepError "snap"))
          (hsPkgs."haskell-coffee" or (errorHandler.buildDepError "haskell-coffee"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."configurator" or (errorHandler.buildDepError "configurator"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }