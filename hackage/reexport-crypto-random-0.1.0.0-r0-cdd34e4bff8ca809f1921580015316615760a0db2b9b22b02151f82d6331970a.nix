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
      identifier = { name = "reexport-crypto-random"; version = "0.1.0.0"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "";
      author = "James Candy";
      homepage = "";
      url = "";
      synopsis = "";
      description = "Names conflict between crypto-api and crypto-random, therefore I export the former in a separate package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."crypto-api" or (errorHandler.buildDepError "crypto-api"))
          ];
        buildable = true;
        };
      };
    }