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
      identifier = { name = "simpleirc"; version = "0.3.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2010 Dominik Picheta";
      maintainer = "Dominik Picheta <dominikpicheta@googlemail.com>";
      author = "Dominik Picheta <dominikpicheta@googlemail.com>";
      homepage = "http://github.com/dom96/SimpleIRC";
      url = "";
      synopsis = "Simple IRC Library";
      description = "Simple IRC Library. This IRC Library aims to be simple and lightweight.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."network" or (errorHandler.buildDepError "network"))
          (hsPkgs."connection" or (errorHandler.buildDepError "connection"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."hspec" or (errorHandler.buildDepError "hspec"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."knob" or (errorHandler.buildDepError "knob"))
            ];
          buildable = true;
          };
        };
      };
    }