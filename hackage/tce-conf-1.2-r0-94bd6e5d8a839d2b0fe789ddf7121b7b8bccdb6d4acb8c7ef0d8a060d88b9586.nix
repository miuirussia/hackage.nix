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
      identifier = { name = "tce-conf"; version = "1.2"; };
      license = "BSD-3-Clause";
      copyright = "2015-2016 Dino Morelli";
      maintainer = "Dino Morelli <dino@ui3.info>";
      author = "Dino Morelli";
      homepage = "http://hub.darcs.net/dino/tce-conf";
      url = "";
      synopsis = "Very simple config file reading";
      description = "This package contains modules for runtime reading of very simple config files of the `key=value` style or as a Haskell data structure to be deserialized with `Read`. The modules support files with blank lines and simple single-line comments, but nothing else.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "KVConf-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."tce-conf" or (errorHandler.buildDepError "tce-conf"))
            ];
          buildable = true;
          };
        "ReadConf-example" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."tce-conf" or (errorHandler.buildDepError "tce-conf"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-hsmisc" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            ];
          buildable = true;
          };
        };
      };
    }