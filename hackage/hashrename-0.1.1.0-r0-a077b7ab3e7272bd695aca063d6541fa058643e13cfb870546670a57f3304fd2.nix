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
      identifier = { name = "hashrename"; version = "0.1.1.0"; };
      license = "GPL-3.0-only";
      copyright = "Copyright (c) Michele Guerini Rocco";
      maintainer = "rnhmjoj@inventati.org";
      author = "rnhmjoj";
      homepage = "https://gist.github.com/rnhmjoj/20ea1b366d45b1c4c0e8";
      url = "";
      synopsis = "Rename every file in a directory with his SHA1 hash.";
      description = "hashrename is a small program to that renames every file in a given\ndirectory by using (a portion) of its SHA1 hash. To clean up a messy\ndirectory call hashrename <path> or just hashrename to use the current one.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hashrename" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."cryptohash" or (errorHandler.buildDepError "cryptohash"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }